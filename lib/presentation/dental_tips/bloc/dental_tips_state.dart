import 'package:equatable/equatable.dart';

import '../../../../data/models/dental_tip_model.dart';

/// Dental tips states
abstract class DentalTipsState extends Equatable {
  const DentalTipsState();

  @override
  List<Object?> get props => [];
}

class DentalTipsInitial extends DentalTipsState {
  const DentalTipsInitial();
}

class DentalTipsLoading extends DentalTipsState {
  const DentalTipsLoading();
}

class DentalTipsLoaded extends DentalTipsState {
  final List<DentalTipModel> tips;

  const DentalTipsLoaded(this.tips);

  @override
  List<Object?> get props => [tips];
}

class DentalTipsError extends DentalTipsState {
  final String message;

  const DentalTipsError(this.message);

  @override
  List<Object?> get props => [message];
}
