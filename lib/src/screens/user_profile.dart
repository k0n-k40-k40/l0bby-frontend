import 'package:flutter/material.dart';
import '../components/navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      bottomNavigationBar: const CustomNavigationBar(
        currentIndex: 3,
      ),
      body: const Center(
        child: Text('Profile Page Content Goes Here'),
      ),
    );
  }
}
