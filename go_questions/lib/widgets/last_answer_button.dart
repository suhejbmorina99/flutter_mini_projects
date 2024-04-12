import 'package:flutter/material.dart';
import 'package:go_questions/data/questions_data.dart';
import 'package:google_fonts/google_fonts.dart';

class LastAnswerButton extends StatelessWidget {
  const LastAnswerButton({
    super.key,
    required this.questionIndex,
  });

  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 80,
        child: ListView(
          children: currentQuestion.getShuffledAnswer().map((answer) {
            return Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/workoutsscreen',
                    ModalRoute.withName(
                        '/workoutsscreen'), // This will remove all routes until the initial route
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
