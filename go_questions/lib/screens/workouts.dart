import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
