import '../entities/calorie_intake.dart';
import '../repositories/calorie_repository.dart';

class CalculateDailyCalorieIntake {
  final CalorieRepository repository;

  CalculateDailyCalorieIntake(this.repository);

  Future<CalorieIntake> call(double weight) async {
    // A lógica base de cálculo pode ser: Calorias = Peso * 24 (apenas um exemplo)
    return repository.calculateCalorieIntake(weight);
  }
}