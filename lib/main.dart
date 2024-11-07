import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/datasources/calorie_data_source.dart';
import 'data/repositories/calorie_repository_impl.dart';
import 'domain/usecases/calculate_daily_calorie_intake.dart';
import 'application/blocs/calorie_bloc.dart';
import 'presentation/pages/home_page.dart';

void main() {
  final dataSource = CalorieDataSource();
  final repository = CalorieRepositoryImpl(dataSource);
  final usecase = CalculateDailyCalorieIntake(repository);
  
  runApp(MyApp(usecase));
}

class MyApp extends StatelessWidget {
  final CalculateDailyCalorieIntake calculateDailyCalorieIntake;

  const MyApp(this.calculateDailyCalorieIntake, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Calorias',
      home: BlocProvider(
        create: (_) => CalorieBloc(calculateDailyCalorieIntake),
        child: HomePage(),
      ),
    );
  }
}