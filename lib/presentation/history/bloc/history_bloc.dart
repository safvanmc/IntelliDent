import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/data_sources/api_data_source.dart';
import 'history_event.dart';
import 'history_state.dart';

/// History BLoC
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final ApiDataSource _apiDataSource;
  static const int pageLimit = 10;
  int _currentPage = 1;

  HistoryBloc({ApiDataSource? apiDataSource})
      : _apiDataSource = apiDataSource ?? ApiDataSource(),
        super(const HistoryInitial()) {
    on<HistoryInitialized>(_onInitialized);
    on<HistoryRefresh>(_onRefresh);
    on<HistoryLoadMore>(_onLoadMore);
  }

  void _onInitialized(
    HistoryInitialized event,
    Emitter<HistoryState> emit,
  ) async {
    emit(const HistoryLoading());
    _currentPage = 1;

    try {
      log('On Initialized ApI');
      final posts = await _apiDataSource.fetchPosts(
        page: _currentPage,
        limit: pageLimit,
      );
      final hasMore = posts.length == pageLimit;
      emit(HistoryLoaded(posts: posts, hasMore: hasMore));
    } catch (e) {
      emit(HistoryError('Failed to load data: ${e.toString()}'));
    }
  }

  void _onRefresh(
    HistoryRefresh event,
    Emitter<HistoryState> emit,
  ) async {
    emit(const HistoryLoading());
    _currentPage = 1;

    try {
      final posts = await _apiDataSource.fetchPosts(
        page: _currentPage,
        limit: pageLimit,
      );
      final hasMore = posts.length == pageLimit;
      emit(HistoryLoaded(posts: posts, hasMore: hasMore));
    } catch (e) {
      emit(HistoryError('Failed to refresh data: ${e.toString()}'));
    }
  }

  void _onLoadMore(
    HistoryLoadMore event,
    Emitter<HistoryState> emit,
  ) async {
    final currentState = state;
    if (currentState is! HistoryLoaded) return;
    if (currentState.isLoadingMore || !currentState.hasMore) return;

    emit(currentState.copyWith(isLoadingMore: true));

    try {
      _currentPage++;
      final newPosts = await _apiDataSource.fetchPosts(
        page: _currentPage,
        limit: pageLimit,
      );

      if (newPosts.isEmpty) {
        emit(currentState.copyWith(hasMore: false, isLoadingMore: false));
        _currentPage--; // Revert page increment if no more data
      } else {
        final updatedPosts = [...currentState.posts, ...newPosts];
        final hasMore = newPosts.length == pageLimit;
        emit(HistoryLoaded(
          posts: updatedPosts,
          hasMore: hasMore,
          isLoadingMore: false,
        ));
      }
    } catch (e) {
      _currentPage--; // Revert page increment on error
      emit(currentState.copyWith(isLoadingMore: false));
      // Optionally show error snackbar or handle error silently
    }
  }
}
