import 'package:flutter/material.dart';
import 'package:go_questions/data/questions_data.dart';
import 'package:go_questions/widgets/answer_question_button.dart';
import 'package:go_questions/widgets/last_answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void goToNextQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    Widget tapButton = AnswerButton(
      questionIndex: currentQuestionIndex,
      onTap: goToNextQuestion,
    );

    if (currentQuestionIndex == questions.length - 1) {
      tapButton = LastAnswerButton(
        questionIndex: currentQuestionIndex,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center horizontally
              children: [
                SmoothPageIndicator(
                  controller: PageController(initialPage: currentQuestionIndex),
                  count: questions.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.lightBlue,
                    dotHeight: 12,
                    dotWidth: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
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
