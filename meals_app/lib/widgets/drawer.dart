import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.black.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text(
                  'Cooking up!',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Colors.black,
            ),
            title: Text(
              'Meals',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            // onTap: () {},
          ),
          const ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Colors.black,
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            // onTap: () {},
          )
        ],
      ),
    );
  }
}
