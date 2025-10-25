import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shops/core/services/category_service.dart';
import 'package:shops/core/services/shop_service.dart';
import 'package:shops/core/utils/snackbar.dart';
import 'package:shops/core/errors/api_exception.dart';
import 'package:shops/features/explore/models/category/category_model.dart';
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

    // Initialize - load everything together
    add(FetchShopsRequested());
  }

  Future<void> _onFetchShopsRequested(
    FetchShopsRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      // Fetch all data in parallel
      final results = await Future.wait([
        _shopService.getShops(featured: true),
        _categoryService.getCategories(),
        _shopService.getShops(
          skip: 0,
          limit: 20,
        ), // No sort params - backend returns random
      ]);

      final featuredShops = results[0] as List<ShopModel>;
      final categories = results[1] as List<CategoryModel>;
      final allShops = results[2] as List<ShopModel>;

      // Initialize category data structures
      Map<int, List<ShopModel>> categoryShops = {};
      Map<int, int> categorySkip = {};
      Map<int, bool> categoryHasMore = {};
      Map<int, bool> categoryLoading = {};

      // Load initial category shops in parallel
      final categoryShopsFutures = categories.map((category) async {
        final shops = await _shopService.getShops(
          categoryId: category.id,
          skip: 0,
          limit: 20,
        ); // No sort params - backend returns random
        return MapEntry(category.id, shops);
      });

      final categoryShopsResults = await Future.wait(categoryShopsFutures);

      for (var entry in categoryShopsResults) {
        categoryShops[entry.key] = entry.value;
        categorySkip[entry.key] = entry.value.length;
        categoryHasMore[entry.key] = entry.value.length == 20;
        categoryLoading[entry.key] = false;
      }

      emit(
        state.copyWith(
          featuredShops: featuredShops,
          categories: categories,
          categoryShops: categoryShops,
          categorySkip: categorySkip,
          categoryHasMore: categoryHasMore,
          categoryLoading: categoryLoading,
          allShops: allShops,
          allSkip: allShops.length,
          allHasMore: allShops.length == 20,
          allLoading: false,
          status: HomeStatus.loaded,
        ),
      );
    } catch (e) {
      final msg = (e is ApiException) ? e.message : e.toString();
      emit(
        state.copyWith(
          status: HomeStatus.error,
          errorMessage: msg,
        ),
      );
      ToastUi.showError(message: msg);
    }
  }

  Future<void> _onFetchAllInitialRequested(
    FetchAllInitialRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.allLoading) return;

    emit(state.copyWith(allLoading: true));

    try {
      final shops = await _shopService.getShops(
        skip: 0,
        limit: event.limit,
      ); // No sort params - backend returns random

      emit(
        state.copyWith(
          allShops: shops,
          allSkip: shops.length,
          allHasMore: shops.length == event.limit,
          allLoading: false,
        ),
      );
    } catch (e) {
      ToastUi.showError(message: (e is ApiException) ? e.message : e.toString());
      emit(state.copyWith(allLoading: false));
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
      ); // No sort params - backend returns random

      // Deduplication: Filter out shops that already exist
      final existingIds = state.allShops.map((shop) => shop.id).toSet();
      final uniqueNewShops = shops.where((shop) => !existingIds.contains(shop.id)).toList();

      // Check if we received shops but all were duplicates
      if (shops.isNotEmpty && uniqueNewShops.isEmpty) {
        // All shops were duplicates - pool exhausted
        emit(
          state.copyWith(
            allHasMore: false,
            allLoading: false,
          ),
        );
        return;
      }

      // Add unique shops
      final next = List<ShopModel>.from(state.allShops)..addAll(uniqueNewShops);

      emit(
        state.copyWith(
          allShops: next,
          allSkip: state.allSkip + uniqueNewShops.length,
          allHasMore: shops.length == event.limit, // Still true if backend returned full page
          allLoading: false,
        ),
      );
    } catch (e) {
      ToastUi.showError(message: (e is ApiException) ? e.message : e.toString());
      emit(state.copyWith(allLoading: false));
    }
  }

  Future<void> _onRefreshAllRequested(
    RefreshAllRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.allLoading) return;

    // Clear existing data
    emit(state.copyWith(allShops: [], allSkip: 0, allHasMore: true));

    // Fetch fresh data
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
      ); // No sort params - backend returns random

      final newCategoryShops = Map<int, List<ShopModel>>.from(
        state.categoryShops,
      );
      newCategoryShops[event.categoryId] = shops;

      final newCategorySkip = Map<int, int>.from(state.categorySkip);
      newCategorySkip[event.categoryId] = shops.length;

      final newCategoryHasMore = Map<int, bool>.from(state.categoryHasMore);
      newCategoryHasMore[event.categoryId] = shops.length == event.limit;

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
      ToastUi.showError(message: (e is ApiException) ? e.message : e.toString());
    }
  }

  Future<void> _onLoadMoreCategoryRequested(
    LoadMoreCategoryRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.categoryLoading[event.categoryId] == true ||
        state.categoryHasMore[event.categoryId] != true) {
      return;
    }

    final newCategoryLoading = Map<int, bool>.from(state.categoryLoading);
    newCategoryLoading[event.categoryId] = true;
    emit(state.copyWith(categoryLoading: newCategoryLoading));

    try {
      final currentSkip = state.categorySkip[event.categoryId] ?? 0;
      final shops = await _shopService.getShops(
        categoryId: event.categoryId,
        skip: currentSkip,
        limit: event.limit,
      ); // No sort params - backend returns random

      final currentShops = state.categoryShops[event.categoryId] ?? [];

      // Deduplication: Filter out shops that already exist in this category
      final existingIds = currentShops.map((shop) => shop.id).toSet();
      final uniqueNewShops = shops.where((shop) => !existingIds.contains(shop.id)).toList();

      // Check if we received shops but all were duplicates
      if (shops.isNotEmpty && uniqueNewShops.isEmpty) {
        // All shops were duplicates - pool exhausted for this category
        final newCategoryHasMore = Map<int, bool>.from(state.categoryHasMore);
        newCategoryHasMore[event.categoryId] = false;

        newCategoryLoading[event.categoryId] = false;

        emit(
          state.copyWith(
            categoryHasMore: newCategoryHasMore,
            categoryLoading: newCategoryLoading,
          ),
        );
        return;
      }

      // Add unique shops
      final newShops = List<ShopModel>.from(currentShops)..addAll(uniqueNewShops);

      final newCategoryShops = Map<int, List<ShopModel>>.from(
        state.categoryShops,
      );
      newCategoryShops[event.categoryId] = newShops;

      final newCategorySkip = Map<int, int>.from(state.categorySkip);
      newCategorySkip[event.categoryId] = currentSkip + uniqueNewShops.length;

      final newCategoryHasMore = Map<int, bool>.from(state.categoryHasMore);
      newCategoryHasMore[event.categoryId] = shops.length == event.limit;

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
      ToastUi.showError(message: (e is ApiException) ? e.message : e.toString());
    }
  }

  Future<void> _onRefreshCategoryRequested(
    RefreshCategoryRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.categoryLoading[event.categoryId] == true) return;

    // Clear existing data for this category
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

    // Fetch fresh data
    await _onFetchCategoryInitialRequested(
      FetchCategoryInitialRequested(
        categoryId: event.categoryId,
        limit: event.limit,
      ),
      emit,
    );
  }
}