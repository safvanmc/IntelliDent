import 'package:equatable/equatable.dart';

/// Navigation states
abstract class NavigationState extends Equatable {
  const NavigationState();
  
  @override
  List<Object?> get props => [];
}

class NavigationInitial extends NavigationState {
  final int currentIndex;
  
  const NavigationInitial({this.currentIndex = 0});
  
  @override
  List<Object?> get props => [currentIndex];
}

