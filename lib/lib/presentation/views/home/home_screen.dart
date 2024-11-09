import 'package:flutter/material.dart';

import '../coming_soon/coming_soon_screen.dart';
import '../movies/movie_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MovieScreen(),
    ComingSoonScreen(),
    ComingSoonScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flix Watch'),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: 0,
          onDestinationSelected: (index) =>
              setState(() => _selectedIndex = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.movie_outlined),
              label: 'Movies',
              selectedIcon: Icon(Icons.movie),
            ),
            NavigationDestination(
              icon: Icon(Icons.tv_outlined),
              label: 'TV Shows',
              selectedIcon: Icon(Icons.tv),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Peoples',
              selectedIcon: Icon(Icons.person),
            ),
          ]),
    );
  }
}
