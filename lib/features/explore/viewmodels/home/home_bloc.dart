import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shops/core/services/category_service.dart';
import 'package:shops/core/services/shop_service.dart';
import 'package:shops/core/utils/snackbar.dart';
import 'package:shops/features/explore/viewmodels/home/home_event.dart';
import 'package:shops/features/explore/viewmodels/home/home_state.dart';
import 'package:shops/shared/models/shop/shop_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ShopService _shopService;
  final CategoryService _categoryService;

  HomeBloc(this._shopService, this._categoryService) : super(HomeState()) {
    on<FetchShopsRequested>(_onFetchShopsRequested);
    on<FetchAllInitialRequested>(_onFetchAllInitialRequested);
    on<LoadMoreAllRequested>(_onLoadMoreAllRequested);
    on<RefreshAllRequested>(_onRefreshAllRequested);
    on<FetchCategoryInitialRequested>(_onFetchCategoryInitialRequested);
    on<LoadMoreCategoryRequested>(_onLoadMoreCategoryRequested);
    on<RefreshCategoryRequested>(_onRefreshCategoryRequested);

    // Initialize both featured shops/categories AND all shops
    add(FetchShopsRequested());
    add(FetchAllInitialRequested());
  }

  Future<void> _onFetchShopsRequested(
    FetchShopsRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      // Get featured Shops
      var featuredShops = await _shopService.getShops();
      featuredShops.removeWhere((shop) => !shop.isFeatured);

      final categories = await _categoryService.getCategories();

      Map<int, List<ShopModel>> categoryShops = {};
      Map<int, int> categorySkip = {};
      Map<int, bool> categoryHasMore = {};
      Map<int, bool> categoryLoading = {};

      for (var category in categories) {
        final shops = await _shopService.getShops(
          categoryId: category.id,
          skip: 0,
          limit: 20,
        );
        categoryShops[category.id] = shops;
        categorySkip[category.id] = shops.length;
        categoryHasMore[category.id] = shops.length == 20;
        categoryLoading[category.id] = false;
      }

      // Don't change status to empty here - let the all shops load first
      emit(
        state.copyWith(
          featuredShops: featuredShops,
          categories: categories,
          categoryShops: categoryShops,
          categorySkip: categorySkip,
          categoryHasMore: categoryHasMore,
          categoryLoading: categoryLoading,
          status: HomeStatus.loaded, // Set to loaded, not empty
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: HomeStatus.error, errorMessage: e.toString()),
      );
      ToastUi.showError(message: e.toString());
    }
  }

  Future<void> _onFetchAllInitialRequested(
    FetchAllInitialRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.allLoading) return;

    // Don't set allLoading during initial app load to avoid UI conflicts
    bool isInitialLoad = state.allShops.isEmpty;
    if (!isInitialLoad) {
      emit(state.copyWith(allLoading: true));
    }

    try {
      final shops = await _shopService.getShops(
        skip: 0,
        limit: event.limit, // Add null safety
        sortBy: SortBy.createdAt,
        sortOrder: SortOrder.desc,
      );

      emit(
        state.copyWith(
          allShops: shops,
          allSkip: shops.length,
          allHasMore: shops.length == (event.limit),
          allLoading: false,
          // If this is initial load and we have shops, ensure status is loaded
          status: isInitialLoad && shops.isNotEmpty
              ? HomeStatus.loaded
              : state.status,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          allLoading: false,
          status: state.allShops.isEmpty ? HomeStatus.error : state.status,
          errorMessage: state.allShops.isEmpty
              ? e.toString()
              : state.errorMessage,
        ),
      );
      ToastUi.showError(message: e.toString());
    }
  }

  Future<void> _onLoadMoreAllRequested(
    LoadMoreAllRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.allLoading || !state.allHasMore) return;
    emit(state.copyWith(allLoading: true));
    try {
      final shops = await _shopService.getShops(
        skip: state.allSkip,
        limit: event.limit,
        sortBy: SortBy.createdAt,
        sortOrder: SortOrder.desc,
      );
      final next = List<ShopModel>.from(state.allShops)..addAll(shops);
      emit(
        state.copyWith(
          allShops: next,
          allSkip: state.allSkip + shops.length,
          allHasMore: shops.length == (event.limit),
          allLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(allLoading: false));
      ToastUi.showError(message: e.toString());
    }
  }

  Future<void> _onRefreshAllRequested(
    RefreshAllRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.allLoading) return;
    emit(state.copyWith(allShops: [], allSkip: 0, allHasMore: true));
    await _onFetchAllInitialRequested(
      FetchAllInitialRequested(limit: event.limit),
      emit,
    );
  }

  Future<void> _onFetchCategoryInitialRequested(
    FetchCategoryInitialRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.categoryLoading[event.categoryId] == true) return;

    final newCategoryLoading = Map<int, bool>.from(state.categoryLoading);
    newCategoryLoading[event.categoryId] = true;
    emit(state.copyWith(categoryLoading: newCategoryLoading));

    try {
      final shops = await _shopService.getShops(
        categoryId: event.categoryId,
        skip: 0,
        limit: event.limit,
        sortBy: SortBy.createdAt,
        sortOrder: SortOrder.desc,
      );

      final newCategoryShops = Map<int, List<ShopModel>>.from(
        state.categoryShops,
      );
      newCategoryShops[event.categoryId] = shops;

      final newCategorySkip = Map<int, int>.from(state.categorySkip);
      newCategorySkip[event.categoryId] = shops.length;

      final newCategoryHasMore = Map<int, bool>.from(state.categoryHasMore);
      newCategoryHasMore[event.categoryId] =
          shops.length == (event.limit);

      newCategoryLoading[event.categoryId] = false;

      emit(
        state.copyWith(
          categoryShops: newCategoryShops,
          categorySkip: newCategorySkip,
          categoryHasMore: newCategoryHasMore,
          categoryLoading: newCategoryLoading,
        ),
      );
    } catch (e) {
      newCategoryLoading[event.categoryId] = false;
      emit(state.copyWith(categoryLoading: newCategoryLoading));
      ToastUi.showError(message: e.toString());
    }
  }

  Future<void> _onLoadMoreCategoryRequested(
    LoadMoreCategoryRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.categoryLoading[event.categoryId] == true ||
        state.categoryHasMore[event.categoryId] != true)
      {return;}

    final newCategoryLoading = Map<int, bool>.from(state.categoryLoading);
    newCategoryLoading[event.categoryId] = true;
    emit(state.copyWith(categoryLoading: newCategoryLoading));

    try {
      final currentSkip = state.categorySkip[event.categoryId] ?? 0;
      final shops = await _shopService.getShops(
        categoryId: event.categoryId,
        skip: currentSkip,
        limit: event.limit,
        sortBy: SortBy.createdAt,
        sortOrder: SortOrder.desc,
      );

      final currentShops = state.categoryShops[event.categoryId] ?? [];
      final newShops = List<ShopModel>.from(currentShops)..addAll(shops);

      final newCategoryShops = Map<int, List<ShopModel>>.from(
        state.categoryShops,
      );
      newCategoryShops[event.categoryId] = newShops;

      final newCategorySkip = Map<int, int>.from(state.categorySkip);
      newCategorySkip[event.categoryId] = currentSkip + shops.length;

      final newCategoryHasMore = Map<int, bool>.from(state.categoryHasMore);
      newCategoryHasMore[event.categoryId] =
          shops.length == (event.limit);

      newCategoryLoading[event.categoryId] = false;

      emit(
        state.copyWith(
          categoryShops: newCategoryShops,
          categorySkip: newCategorySkip,
          categoryHasMore: newCategoryHasMore,
          categoryLoading: newCategoryLoading,
        ),
      );
    } catch (e) {
      newCategoryLoading[event.categoryId] = false;
      emit(state.copyWith(categoryLoading: newCategoryLoading));
      ToastUi.showError(message: e.toString());
    }
  }

  Future<void> _onRefreshCategoryRequested(
    RefreshCategoryRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.categoryLoading[event.categoryId] == true) return;

    final newCategoryShops = Map<int, List<ShopModel>>.from(
      state.categoryShops,
    );
    newCategoryShops[event.categoryId] = [];

    final newCategorySkip = Map<int, int>.from(state.categorySkip);
    newCategorySkip[event.categoryId] = 0;

    final newCategoryHasMore = Map<int, bool>.from(state.categoryHasMore);
    newCategoryHasMore[event.categoryId] = true;

    emit(
      state.copyWith(
        categoryShops: newCategoryShops,
        categorySkip: newCategorySkip,
        categoryHasMore: newCategoryHasMore,
      ),
    );

    await _onFetchCategoryInitialRequested(
      FetchCategoryInitialRequested(
        categoryId: event.categoryId,
        limit: event.limit,
      ),
      emit,
    );
  }
}
