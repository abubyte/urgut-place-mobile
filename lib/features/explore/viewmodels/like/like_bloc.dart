import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urgut_place/config/di/injection.dart';
import 'package:urgut_place/core/services/like_service.dart';
import 'package:urgut_place/core/services/shop_service.dart';
import 'package:urgut_place/core/utils/snackbar.dart';
import 'package:urgut_place/features/explore/models/like/like_model.dart';
import 'package:urgut_place/features/explore/viewmodels/like/like_event.dart';
import 'package:urgut_place/features/explore/viewmodels/like/like_state.dart';
import 'package:urgut_place/shared/models/shop/shop_model.dart';

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
      final shops = await getIt<ShopService>().getShops();
      final likes = await _likeService.getLikes();
      final shopIds = likes.map((like) => like.shopId).toList();

      if (likes.isEmpty) {
        emit(state.copyWith(status: LikeStatus.empty, likedShops: [], likes: [], shopIds: []));
      } else {
        emit(
          state.copyWith(
            status: LikeStatus.success,
            likedShops: shops.where((shop) => shopIds.contains(shop.id)).toList(),
            likes: likes,
            shopIds: shopIds,
          ),
        );
      }
    } catch (e) {
      ToastUi.showError(message: e.toString());
      emit(state.copyWith(status: LikeStatus.failure));
    }
  }

  Future<void> _onCreateLike(CreateLike event, Emitter<LikeState> emit) async {
    emit(state.copyWith(status: LikeStatus.loading));

    try {
      final like = await _likeService.createLike(event.shopId);
      final newLikes = state.likes + [like];
      final newShopIds = state.shopIds + [like.shopId];
      final shop = await getIt<ShopService>().getShop(like.shopId);
      final newLikedShops = state.likedShops + [shop];

      emit(state.copyWith(status: LikeStatus.success, likes: newLikes, shopIds: newShopIds, likedShops: newLikedShops));
    } catch (e) {
      ToastUi.showError(message: e.toString());
      emit(state.copyWith(status: LikeStatus.failure));
    }
  }

  Future<void> _onDeleteLike(DeleteLike event, Emitter<LikeState> emit) async {
    emit(state.copyWith(status: LikeStatus.loading));

    try {
      final likeId = state.likes.where((like) => like.shopId == event.shopId).first.id;
      await _likeService.deleteLike(likeId);

      List<ShopModel> newLikedShops = List.from(state.likedShops);
      newLikedShops.removeWhere((shop) => shop.id == event.shopId);

      List<LikeModel> newLikes = List.from(state.likes);
      newLikes.removeWhere((like) => like.shopId == event.shopId);

      List<int> newShopIds = List.from(state.shopIds);
      newShopIds.removeWhere((id) => id == event.shopId);

      emit(
        state.copyWith(
          status: LikeStatus.success,
          likedShops: state.likedShops,
          likes: state.likes,
          shopIds: state.shopIds,
        ),
      );
    } catch (e) {
      ToastUi.showError(message: e.toString());
      emit(state.copyWith(status: LikeStatus.failure));
    }
  }
}
