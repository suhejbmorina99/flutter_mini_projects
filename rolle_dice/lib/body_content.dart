import 'package:flutter/material.dart';
import 'package:rolle_dice/text_style.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class BodyContent extends StatelessWidget {
  const BodyContent(this.colors, {super.key});
  // This two options are the same
  // const BodyContent({super.key, required this.colors);

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(child: TextStyleWidget('Hello World!')),
    );
  }
}
