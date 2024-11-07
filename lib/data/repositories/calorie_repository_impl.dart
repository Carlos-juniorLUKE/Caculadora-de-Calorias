import '../../domain/entities/calorie_intake.dart';
import '../../domain/repositories/calorie_repository.dart';
import '../datasources/calorie_data_source.dart';

class CalorieRepositoryImpl implements CalorieRepository {
  final CalorieDataSource dataSource;

  CalorieRepositoryImpl(this.dataSource);

  @override
  Future<CalorieIntake> calculateCalorieIntake(double weight) {
    return dataSource.calculateCalorieIntake(weight);
  }
}