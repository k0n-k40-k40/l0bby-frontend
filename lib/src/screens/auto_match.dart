import "package:flutter/material.dart";
import "../components/navigation_bar.dart";

class AutoMatchScreen extends StatelessWidget {
  const AutoMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Automatic Matching')),
      bottomNavigationBar: const CustomNavigationBar(
        currentIndex: 1,
      ),
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
