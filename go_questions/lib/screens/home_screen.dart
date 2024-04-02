import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Embrace Movement, Embrace Freedom.',
              style: GoogleFonts.nunito(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Image.asset(
              'assets/images/home_image.png',
              width: 350,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
              ),
              child: Text(
                'Continue',
                style: GoogleFonts.nunito(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
