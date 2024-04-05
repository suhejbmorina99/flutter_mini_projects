import 'package:flutter/material.dart';
import 'package:go_questions/data/questions_data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var activeScreen = 'start-screen';
  var currentQuestionIndex = 0;

  void goToNextQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    Widget tapButton = TextButton(
      onPressed: goToNextQuestion,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        foregroundColor: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text(
        'Tap to continue',
        style: GoogleFonts.nunito(
          fontSize: 18,
        ),
      ),
    );

    if (currentQuestionIndex == questions.length - 1) {
      tapButton = TextButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/workoutsscreen',
            ModalRoute.withName(
                '/workoutsscreen'), // This will remove all routes until the initial route
          );
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 118, vertical: 10),
          foregroundColor: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          'Finish',
          style: GoogleFonts.nunito(
            fontSize: 18,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Str8ch',
          style: GoogleFonts.nunito(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Text(currentQuestion.question),
            const Spacer(),
            tapButton,
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
