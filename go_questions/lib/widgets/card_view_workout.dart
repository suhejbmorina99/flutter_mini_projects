import 'package:flutter/material.dart';

class CardViewWorkout extends StatelessWidget {
  const CardViewWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: const Center(child: Text('First Row')),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blueAccent,
                    child: const Center(child: Text('Second Row')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
