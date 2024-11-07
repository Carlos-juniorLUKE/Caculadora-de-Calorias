import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/blocs/calorie_bloc.dart';
import '../widgets/calorie_input.dart';

class HomePage extends StatelessWidget {
  final TextEditingController weightController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Calorias'),
      ),
      body: BlocBuilder<CalorieBloc, CalorieState>(
        builder: (context, state) {
          if (state is CalorieInitial) {
            return CalorieInput(
              controller: weightController,
              onCalculate: () {
                final weight = double.parse(weightController.text);
                context.read<CalorieBloc>().add(CalculateCalorie(weight));
              },
            );
          } else if (state is CalorieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CalorieLoaded) {
            return Center(
              child: Text(
                'Ingestão diária de calorias: ${state.intake.calories.toStringAsFixed(2)} kcal',
                style: const TextStyle(fontSize: 24),
              ),
            );
          } else {
            return const Center(child: Text('Ocorreu um erro. Por favor, tente novamente.'));
          }
        },
      ),
    );
  }
}