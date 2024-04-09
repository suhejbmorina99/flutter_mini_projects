import 'package:flutter/material.dart';
import 'package:go_questions/data/questions_data.dart';
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
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                child: ListView(
                  children: currentQuestion.getShuffledAnswer().map((answer) {
                    return Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.lightBlue,
                        child: Center(
                          child: Text(
                            answer,
                            style: GoogleFonts.nunito(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
