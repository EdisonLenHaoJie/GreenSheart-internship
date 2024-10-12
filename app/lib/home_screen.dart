import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> medications = [
    'Aspirin',
    'Ibuprofen',
    'Paracetamol',
    'Amoxicillin',
    'Metformin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medications'),
      ),
      body: ListView.builder(
        itemCount: medications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(medications[index]),
            onTap: () {
              // Provide feedback to the user
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: ${medications[index]}')),
              );
            },
          );
        },
      ),
    );
  }
}