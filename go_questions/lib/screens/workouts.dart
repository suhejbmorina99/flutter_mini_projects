import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:go_questions/screens/preferences_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() {
    return _WorkoutScreenState();
  }
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = Column(
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
    );

    if (_selectedPageIndex == 1) {
      activeScreen = const PreferencesScreen();
    }

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
      body: activeScreen,
      bottomNavigationBar: CurvedNavigationBar(
        onTap: _selectPage,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.sports_gymnastics),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOutBack,
        animationDuration: const Duration(milliseconds: 1300),
      ),
    );
  }
}
