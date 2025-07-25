import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.freezed.dart';

@freezed
abstract class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchRequested(String? query) = SearchRequested;
  const factory SearchEvent.refreshRequested() = RefreshRequested;
}
