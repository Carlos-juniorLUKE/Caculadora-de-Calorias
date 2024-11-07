import 'package:flutter/material.dart';

class CalorieInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onCalculate;

  const CalorieInput({super.key, required this.controller, required this.onCalculate});
  @override
  Widget build(BuildContext context) {
    return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      'Insira seu peso (kg)',
      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 4.0),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: const TextField(
        style: TextStyle(fontSize: 16.0),
      ),
    ),
    ElevatedButton(
          onPressed: onCalculate,
          child: const Text('Calcular a ingestão diária de calorias'),
        ),
  ],
);
  }
}