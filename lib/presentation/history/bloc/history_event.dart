import 'package:equatable/equatable.dart';

/// History events
abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object?> get props => [];
}

class HistoryInitialized extends HistoryEvent {
  const HistoryInitialized();
}

class HistoryRefresh extends HistoryEvent {
  const HistoryRefresh();
}

class HistoryLoadMore extends HistoryEvent {
  const HistoryLoadMore();
}
