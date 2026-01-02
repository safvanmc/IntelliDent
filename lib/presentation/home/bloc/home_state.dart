import 'package:equatable/equatable.dart';

/// Home states
abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoaded extends HomeState {
  const HomeLoaded();
}

