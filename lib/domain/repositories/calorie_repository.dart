import '../../domain/entities/calorie_intake.dart';

abstract class CalorieRepository {
  Future<CalorieIntake> calculateCalorieIntake(double weight);
}