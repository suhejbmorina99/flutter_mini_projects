import 'package:flutter/material.dart';
import 'package:quiz_app/home_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 84, 15, 203),
                Color.fromARGB(255, 72, 39, 129)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: const HomeScreen()),
      ),
    );
  }
}
