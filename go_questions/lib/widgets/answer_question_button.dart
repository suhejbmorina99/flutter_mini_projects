import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.answerText,
    required this.onTap,
    super.key,
  });

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
        style: GoogleFonts.lato(
          fontSize: 12,
        ),
      ),
    );
  }
}
