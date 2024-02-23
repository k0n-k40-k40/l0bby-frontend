import 'package:flutter/material.dart';

class RoomDetailsPage extends StatelessWidget {
  const RoomDetailsPage({super.key, required this.roomId});

  final String roomId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Details'),
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
