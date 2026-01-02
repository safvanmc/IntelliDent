import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

/// Profile BLoC
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileInitial()) {
    on<ProfileInitialized>(_onInitialized);
  }
  
  void _onInitialized(
    ProfileInitialized event,
    Emitter<ProfileState> emit,
  ) {
    emit(const ProfileLoaded());
  }
}

