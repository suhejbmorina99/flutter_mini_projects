import 'package:flutter/material.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        actions: const [
          Text('New Meals App'),
        ],
        backgroundColor: Colors.green,
      ),
    ));
  }
}
