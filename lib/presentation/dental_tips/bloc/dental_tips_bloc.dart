import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/dental_tip_model.dart';
import 'dental_tips_event.dart';
import 'dental_tips_state.dart';

/// Dental tips BLoC
class DentalTipsBloc extends Bloc<DentalTipsEvent, DentalTipsState> {
  DentalTipsBloc() : super(const DentalTipsInitial()) {
    on<DentalTipsInitialized>(_onInitialized);
  }

  void _onInitialized(
    DentalTipsInitialized event,
    Emitter<DentalTipsState> emit,
  ) async {
    emit(const DentalTipsLoading());

    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/dental_tips.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> tipsJson = jsonData['tips'] as List<dynamic>;

      final List<DentalTipModel> tips = tipsJson
          .map((tipJson) =>
              DentalTipModel.fromJson(tipJson as Map<String, dynamic>))
          .toList();

      emit(DentalTipsLoaded(tips));
    } catch (e) {
      emit(DentalTipsError('Failed to load dental tips: ${e.toString()}'));
    }
  }
}
