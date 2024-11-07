import '../../domain/entities/calorie_intake.dart';

class CalorieDataSource {
  Future<CalorieIntake> calculateCalorieIntake(double weight) async {
    final double calories = weight * 24; // Exemplo de cálculo
    return CalorieIntake(calories: calories);
  }
}