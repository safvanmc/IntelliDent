import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

/// Home BLoC
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<HomeInitialized>(_onInitialized);
  }
  
  void _onInitialized(
    HomeInitialized event,
    Emitter<HomeState> emit,
  ) {
    emit(const HomeLoaded());
  }
}

