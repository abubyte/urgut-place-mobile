import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urgut_place/core/services/shop_service.dart';
import 'package:urgut_place/core/utils/snackbar.dart';
import 'package:urgut_place/features/search/viewmodels/search/search_event.dart';
import 'package:urgut_place/features/search/viewmodels/search/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ShopService _shopService;
  SearchBloc(this._shopService) : super(SearchState()) {
    on<SearchRequested>(_onSearchRequested);
    on<RefreshRequested>(_onRefreshRequested);
  }

  final searchController = TextEditingController();

  Future<void> _onSearchRequested(SearchRequested event, Emitter<SearchState> emit) async {
    try {
      emit(state.copyWith(status: SearchStatus.loading));

      final result = await _shopService.getShops(
        search: searchController.text.trim(),
        sortBy: SortBy.rating,
        sortOrder: SortOrder.desc,
      );

      if (result.isNotEmpty) {
        emit(state.copyWith(status: SearchStatus.success, result: result));
      } else {
        emit(state.copyWith(status: SearchStatus.empty, result: []));
      }
    } catch (e) {
      ToastUi.showError(message: e.toString());
      emit(state.copyWith(status: SearchStatus.failure, result: null));
    }
  }

  void _onRefreshRequested(RefreshRequested event, Emitter<SearchState> emit) {
    emit(state.copyWith(emptyQuery: !state.emptyQuery));
  }

  void search() {
    add(SearchRequested(searchController.text.trim()));
  }

  void refresh() {
    add(RefreshRequested());
  }
}
