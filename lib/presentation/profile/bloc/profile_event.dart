import 'package:equatable/equatable.dart';

/// Profile events
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  
  @override
  List<Object?> get props => [];
}

class ProfileInitialized extends ProfileEvent {
  const ProfileInitialized();
}

