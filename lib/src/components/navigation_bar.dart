// In src/components/navigation_bar.dart
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  void _navigateTo(int index, BuildContext context) {
    String routeName;
    switch (index) {
      case 0:
        routeName = '/';
        break;
      case 1:
        routeName = '/automatic';
        break;
      case 2:
        routeName = '/manual';
        break;
      case 3:
        routeName = '/profile';
        break;
      default:
        return;
    }
    // Check if the current route is different from the intended route
    // to prevent unnecessary navigation to the same page.
    if (ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF333333),
      currentIndex: currentIndex,
      onTap: (index) => _navigateTo(index, context),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Color(0xFF333333),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Auto',
          backgroundColor: Color(0xFF333333),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.meeting_room),
          label: 'Manual',
          backgroundColor: Color(0xFF333333),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
          backgroundColor: Color(0xFF333333),
        ),
      ],
    );
  }
}
