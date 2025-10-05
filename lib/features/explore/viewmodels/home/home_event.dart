import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchShopsRequested() = FetchShopsRequested;
  const factory HomeEvent.fetchAllInitialRequested({@Default(20) int limit}) =
      FetchAllInitialRequested;
  const factory HomeEvent.loadMoreAllRequested({@Default(20) int limit}) =
      LoadMoreAllRequested;
  const factory HomeEvent.refreshAllRequested({@Default(20) int limit}) =
      RefreshAllRequested;
  const factory HomeEvent.fetchCategoryInitialRequested({
    required int categoryId,
    @Default(20) int limit,
  }) = FetchCategoryInitialRequested;
  const factory HomeEvent.loadMoreCategoryRequested({
    required int categoryId,
    @Default(20) int limit,
  }) = LoadMoreCategoryRequested;
  const factory HomeEvent.refreshCategoryRequested({
    required int categoryId,
    @Default(20) int limit,
  }) = RefreshCategoryRequested;
}
