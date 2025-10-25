import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shops/config/di.dart';
import 'package:shops/core/services/like_service.dart';
import 'package:shops/core/services/shop_service.dart';
import 'package:shops/core/utils/snackbar.dart';
import 'package:shops/core/errors/api_exception.dart';
import 'package:shops/features/explore/viewmodels/like/like_event.dart';
import 'package:shops/features/explore/viewmodels/like/like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  final LikeService _likeService;

  LikeBloc(this._likeService) : super(LikeState()) {
    on<GetLikes>(_onGetLikes);
    on<CreateLike>(_onCreateLike);
    on<DeleteLike>(_onDeleteLike);

    add(GetLikes());
  }

  Future<void> _onGetLikes(GetLikes event, Emitter<LikeState> emit) async {
    emit(state.copyWith(status: LikeStatus.loading));
    try {
      final shops = await getIt<ShopService>().getShops(limit: 100, skip: 0);
      final likedShopIds = await _likeService.getLikes();

      final likedShops = shops.where((shop) => likedShopIds.contains(shop.id.toString())).toList();

      if (likedShopIds.isEmpty) {
        emit(state.copyWith(status: LikeStatus.empty, likedShops: [], shopIds: []));
      } else {
        emit(state.copyWith(status: LikeStatus.success, likedShops: likedShops, shopIds: likedShopIds));
      }
    } catch (e) {
      ToastUi.showError(message: _errorMessage(e));
      emit(state.copyWith(status: LikeStatus.failure));
    }
  }

  Future<void> _onCreateLike(CreateLike event, Emitter<LikeState> emit) async {
    emit(state.copyWith(status: LikeStatus.loading));

    try {
      await _likeService.createLike(event.shopId);
      final newShopIds = state.shopIds + [event.shopId.toString()];

      final shop = await getIt<ShopService>().getShop(event.shopId);
      final newLikedShops = state.likedShops + [shop];

      emit(state.copyWith(status: LikeStatus.success, shopIds: newShopIds, likedShops: newLikedShops));
    } catch (e) {
      ToastUi.showError(message: _errorMessage(e));
      emit(state.copyWith(status: LikeStatus.failure));
    }
  }

  Future<void> _onDeleteLike(DeleteLike event, Emitter<LikeState> emit) async {
    emit(state.copyWith(status: LikeStatus.loading));

    try {
      await _likeService.deleteLike(event.shopId.toString());

      final newLikedShops = state.likedShops.where((shop) => shop.id != event.shopId).toList();
      final newShopIds = state.shopIds.where((id) => id != event.shopId.toString()).toList();

      emit(state.copyWith(status: LikeStatus.success, likedShops: newLikedShops, shopIds: newShopIds));
    } catch (e) {
      ToastUi.showError(message: _errorMessage(e));
      emit(state.copyWith(status: LikeStatus.failure));
    }
  }

  String _errorMessage(Object? e) {
    if (e is ApiException) return e.message;
    return e?.toString() ?? 'Noma\'lum xato yuz berdi';
  }
}
