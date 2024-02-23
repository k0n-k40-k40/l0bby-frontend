import 'package:flutter/material.dart';

class ManualMatchScreen extends StatelessWidget {
  const ManualMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manual Matching')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/');
          },
          child: const Text('Go to Home Page'),
        ),
      ),
    );
  }
}
