import 'package:equatable/equatable.dart';

/// Dental tips events
abstract class DentalTipsEvent extends Equatable {
  const DentalTipsEvent();

  @override
  List<Object?> get props => [];
}

class DentalTipsInitialized extends DentalTipsEvent {
  const DentalTipsInitialized();
}

class DentalTipSelected extends DentalTipsEvent {
  final int tipId;

  const DentalTipSelected(this.tipId);

  @override
  List<Object?> get props => [tipId];
}
