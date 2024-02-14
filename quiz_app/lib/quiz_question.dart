import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuizQuestionScreen();
  }
}

class _QuizQuestionScreen extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Question...',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(answerText: 'Answer 1', onTap: () {}),
          AnswerButton(answerText: 'Answer 2', onTap: () {}),
          AnswerButton(answerText: 'Answer 3', onTap: () {}),
          AnswerButton(answerText: 'Answer 4', onTap: () {})
        ],
      ),
    );
  }
}
