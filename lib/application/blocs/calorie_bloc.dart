import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/calorie_intake.dart';
import '../../domain/usecases/calculate_daily_calorie_intake.dart';

abstract class CalorieEvent {}
class CalculateCalorie extends CalorieEvent {
  final double weight;

  CalculateCalorie(this.weight);
}

abstract class CalorieState {}
class CalorieInitial extends CalorieState {}
class CalorieLoading extends CalorieState {}
class CalorieLoaded extends CalorieState {
  final CalorieIntake intake;

  CalorieLoaded(this.intake);
}
class CalorieError extends CalorieState {}

class CalorieBloc extends Bloc<CalorieEvent, CalorieState> {
  final CalculateDailyCalorieIntake calculateCalorieIntake;

  CalorieBloc(this.calculateCalorieIntake) : super(CalorieInitial()) {
    on<CalculateCalorie>((event, emit) async {
      emit(CalorieLoading());
      try {
        final intake = await calculateCalorieIntake(event.weight);
        emit(CalorieLoaded(intake));
      } catch (_) {
        emit(CalorieError());
      }
    });
  }
}