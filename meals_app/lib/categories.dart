import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text('Choose a category'),
        backgroundColor: Colors.green,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2, // Me kta nenkuptojm 3/2 madhsia e elementit
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Card(
            child: Text('1'),
          ),
          Card(
            child: Text('2'),
          ),
          Card(
            child: Text('3'),
          ),
          Card(
            child: Text('4'),
          ),
          Card(
            child: Text('5'),
          ),
          Card(
            child: Text('6'),
          ),
        ],
      ),
    ));
  }
}
