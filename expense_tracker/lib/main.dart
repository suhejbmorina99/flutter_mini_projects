import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 157, 211, 113),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.all(6),
        ),
        // filledButtonTheme: FilledButtonThemeData(
        //   style: FilledButton.styleFrom(
        //     backgroundColor: kDarkColorScheme.primaryContainer,
        //     foregroundColor: kDarkColorScheme.onPrimaryContainer,
        //   ),
        // ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.all(6),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.black,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.normal,
                color:
                    Colors.black, // Nese qeky text theme perdoret dika tjeter
                // psh ne expense item i merr qeto atribute por atributi color
                // i shkon vetem disa elementeve jo krejt texteve sepse
                // kemi perdorur foregroundColor psh per
                fontSize: 16,
              ),
            ),
      ),
      home: const Expenses(),
    ),
  );
}
