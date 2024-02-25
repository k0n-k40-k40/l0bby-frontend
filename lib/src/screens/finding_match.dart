import 'package:flutter/material.dart';

class FindingMatchPage extends StatelessWidget {
  const FindingMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finding Match'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Center(
        child: Text(
          'Looking for a match...',
          style: TextStyle(fontSize: 24),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
