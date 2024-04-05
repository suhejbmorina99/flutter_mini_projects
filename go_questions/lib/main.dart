import 'package:flutter/material.dart';
import 'package:go_questions/screens/home_screen.dart';
import 'package:go_questions/screens/questions_screen.dart';
import 'package:go_questions/screens/workouts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        '/questionsscreen': (context) => const QuestionsScreen(),
        '/workoutsscreen': (context) => const WorkoutScreen(),
      },
    );
  }
}
