import 'package:equatable/equatable.dart';

/// Profile states
abstract class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoaded extends ProfileState {
  const ProfileLoaded();
}

