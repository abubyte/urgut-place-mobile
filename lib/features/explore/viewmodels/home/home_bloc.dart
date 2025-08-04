import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urgut_place/core/services/category_service.dart';
import 'package:urgut_place/core/services/shop_service.dart';
import 'package:urgut_place/core/utils/snackbar.dart';
import 'package:urgut_place/features/explore/viewmodels/home/home_event.dart';
import 'package:urgut_place/features/explore/viewmodels/home/home_state.dart';
import 'package:urgut_place/shared/models/shop/shop_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ShopService _shopService;
  final CategoryService _categoryService;

  HomeBloc(this._shopService, this._categoryService) : super(HomeState()) {
    on<FetchShopsRequested>(_onFetchShopsRequested);

    add(FetchShopsRequested());
  }

  Future<void> _onFetchShopsRequested(FetchShopsRequested event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      // Get featured Shops
      var featuredShops = await _shopService.getShops();
      featuredShops.removeWhere((shop) => !shop.isFeatured);

      final categories = await _categoryService.getCategories();

      Map<int, List<ShopModel>> categoryShops = {};
      for (var category in categories) {
        final shops = await _shopService.getShops(categoryId: category.id);
        categoryShops[category.id] = shops;
      }

      if (featuredShops.isEmpty || categories.isEmpty || categoryShops.isEmpty) {
        emit(state.copyWith(status: HomeStatus.empty));
      }

      emit(
        state.copyWith(
          featuredShops: featuredShops,
          categories: categories,
          categoryShops: categoryShops,
          status: HomeStatus.loaded,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error, errorMessage: e.toString()));
      ToastUi.showError(message: e.toString());
    }
  }
}
