import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.answerText,
    required this.onTap,
    super.key,
  });

  // Kjo posht eshte positional argument e kjo nelt named arguments
  // po une pe perdori named arguments
  // se kur e perdori qete komponent dika tjeter
  // e di cilin parameter pe perdori si value shihe file quiz_questions
  // dmth named argument targetohet permes emrit te parametrit

  // const AnswerButton(
  //   this.answerText,
  //   this.onTap, {
  //   super.key,
  // });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(40),
        // ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
