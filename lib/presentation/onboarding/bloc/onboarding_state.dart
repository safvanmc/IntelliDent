import 'package:equatable/equatable.dart';

/// Onboarding states
abstract class OnboardingState extends Equatable {
  const OnboardingState();
  
  @override
  List<Object?> get props => [];
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

class OnboardingPageState extends OnboardingState {
  final int currentPage;
  final int totalPages;
  
  const OnboardingPageState({
    required this.currentPage,
    required this.totalPages,
  });
  
  bool get isFirstPage => currentPage == 0;
  bool get isLastPage => currentPage == totalPages - 1;
  
  @override
  List<Object?> get props => [currentPage, totalPages];
}

class OnboardingCompleted extends OnboardingState {
  const OnboardingCompleted();
}

