import 'package:equatable/equatable.dart';

/// Home events
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  
  @override
  List<Object?> get props => [];
}

class HomeInitialized extends HomeEvent {
  const HomeInitialized();
}

