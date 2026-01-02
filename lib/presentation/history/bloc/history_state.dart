import 'package:equatable/equatable.dart';

import '../../../../data/models/api_post_model.dart';

/// History states
abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object?> get props => [];
}

class HistoryInitial extends HistoryState {
  const HistoryInitial();
}

class HistoryLoading extends HistoryState {
  const HistoryLoading();
}

class HistoryLoaded extends HistoryState {
  final List<ApiPostModel> posts;
  final bool hasMore;
  final bool isLoadingMore;

  const HistoryLoaded({
    required this.posts,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

  HistoryLoaded copyWith({
    List<ApiPostModel>? posts,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return HistoryLoaded(
      posts: posts ?? this.posts,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [posts, hasMore, isLoadingMore];
}

class HistoryError extends HistoryState {
  final String message;

  const HistoryError(this.message);

  @override
  List<Object?> get props => [message];
}
