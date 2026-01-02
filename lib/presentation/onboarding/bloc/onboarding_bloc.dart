import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/onboarding_model.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

/// Onboarding BLoC
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingPageState(
    currentPage: 0,
    totalPages: OnboardingData.pages.length,
  )) {
    on<OnboardingNextPage>(_onNextPage);
    on<OnboardingPreviousPage>(_onPreviousPage);
    on<OnboardingPageChanged>(_onPageChanged);
    on<OnboardingSkip>(_onSkip);
    on<OnboardingComplete>(_onComplete);
  }
  
  void _onNextPage(
    OnboardingNextPage event,
    Emitter<OnboardingState> emit,
  ) {
    final currentState = state;
    if (currentState is OnboardingPageState) {
      if (!currentState.isLastPage) {
        emit(OnboardingPageState(
          currentPage: currentState.currentPage + 1,
          totalPages: currentState.totalPages,
        ));
      }
    }
  }
  
  void _onPreviousPage(
    OnboardingPreviousPage event,
    Emitter<OnboardingState> emit,
  ) {
    final currentState = state;
    if (currentState is OnboardingPageState) {
      if (!currentState.isFirstPage) {
        emit(OnboardingPageState(
          currentPage: currentState.currentPage - 1,
          totalPages: currentState.totalPages,
        ));
      }
    }
  }
  
  void _onPageChanged(
    OnboardingPageChanged event,
    Emitter<OnboardingState> emit,
  ) {
    final currentState = state;
    if (currentState is OnboardingPageState) {
      emit(OnboardingPageState(
        currentPage: event.pageIndex,
        totalPages: currentState.totalPages,
      ));
    }
  }
  
  void _onSkip(
    OnboardingSkip event,
    Emitter<OnboardingState> emit,
  ) {
    emit(const OnboardingCompleted());
  }
  
  void _onComplete(
    OnboardingComplete event,
    Emitter<OnboardingState> emit,
  ) {
    emit(const OnboardingCompleted());
  }
}

