import 'package:flutter/material.dart';
import '/src/screens/auto_match.dart';
import '/src/screens/home.dart';
import '/src/screens/manual_match.dart';
// Import other screens you need in the navigation

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BaseLayoutState createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AutoMatchScreen(),
    const ManualMatchScreen(),
    // Add more screens as needed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Wrap Scaffold with SafeArea
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Auto Match'),
            BottomNavigationBarItem(
                icon: Icon(Icons.group_work), label: 'Manual Match'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
