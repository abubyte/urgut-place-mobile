import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shops/core/services/shop_service.dart';
import 'package:shops/core/utils/snackbar.dart';
import 'package:shops/core/errors/api_exception.dart';
import 'package:shops/features/search/viewmodels/search/search_event.dart';
import 'package:shops/features/search/viewmodels/search/search_state.dart';
import 'package:shops/shared/models/shop/shop_model.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ShopService _shopService;
  SearchBloc(this._shopService) : super(SearchState()) {
    on<SearchRequested>(_onSearchRequested);
    on<RefreshRequested>(_onRefreshRequested);
    on<LoadMoreRequested>(_onLoadMoreRequested);
  }

  final searchController = TextEditingController();

  Future<void> _onSearchRequested(
    SearchRequested event,
    Emitter<SearchState> emit,
  ) async {
    try {
      emit(state.copyWith(status: SearchStatus.loading, searchLoading: true));

      final result = await _shopService.getShops(
        search: searchController.text.trim(),
        skip: 0,
        limit: 20,
      );

      if (result.isNotEmpty) {
        emit(
          state.copyWith(
            status: SearchStatus.success,
            result: result,
            searchSkip: result.length,
            searchHasMore: result.length == 20,
            searchLoading: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: SearchStatus.empty,
            result: [],
            searchSkip: 0,
            searchHasMore: false,
            searchLoading: false,
          ),
        );
      }
    } catch (e) {
      ToastUi.showError(message: (e is ApiException) ? e.message : e.toString());
      emit(
        state.copyWith(
          status: SearchStatus.failure,
          result: null,
          searchLoading: false,
        ),
      );
    }
  }

  void _onRefreshRequested(RefreshRequested event, Emitter<SearchState> emit) {
    emit(state.copyWith(emptyQuery: !state.emptyQuery));
  }

  Future<void> _onLoadMoreRequested(
    LoadMoreRequested event,
    Emitter<SearchState> emit,
  ) async {
    if (state.searchLoading || !state.searchHasMore) return;

    emit(state.copyWith(searchLoading: true));

    try {
      final result = await _shopService.getShops(
        search: searchController.text.trim(),
        skip: state.searchSkip,
        limit: event.limit,
      );

      final currentResults = state.result ?? [];
      final newResults = List<ShopModel>.from(currentResults)..addAll(result);

      emit(
        state.copyWith(
          result: newResults,
          searchSkip: state.searchSkip + result.length,
          searchHasMore: result.length == event.limit,
          searchLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(searchLoading: false));
      ToastUi.showError(message: (e is ApiException) ? e.message : e.toString());
    }
  }

  void search() {
    add(SearchRequested(searchController.text.trim()));
  }

  void refresh() {
    add(RefreshRequested());
  }

  void loadMore() {
    add(LoadMoreRequested());
  }
}
