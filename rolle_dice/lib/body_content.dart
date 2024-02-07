import 'package:flutter/material.dart';
import 'package:rolle_dice/text_style.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class BodyContent extends StatelessWidget {
  const BodyContent({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 74, 58, 223),
            Color.fromARGB(255, 139, 127, 240)
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(child: TextStyleWidget()),
    );
  }
}
