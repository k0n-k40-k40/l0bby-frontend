import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // Constructor is marked as const

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using const if Scaffold's child is also a const
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/auth');
              },
              child: const Text('Go to Auth Page'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/automatic');
              },
              child: const Text('Go to Automatic Match Page'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/manual');
              },
              child: const Text('Go to Manual Match Page'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(
                  context,
                  '/profile',
                  arguments: {'profileId': '123jgh123'},
                );
              },
              child: const Text('Go to Profile Page'),
            ),
          ],
        ),
      ),
    );
  }
}
