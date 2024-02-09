import 'package:flutter/material.dart';
import 'package:rolle_dice/body_content.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: BodyContent([
          Color.fromARGB(255, 74, 58, 223),
          Color.fromARGB(255, 139, 127, 240)
        ]),
      ),
    ),
  );
}
