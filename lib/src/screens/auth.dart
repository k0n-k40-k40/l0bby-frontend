import 'package:flutter/material.dart';
import '../components/image_uploader.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    super.key
  });

  // final bool isUploaded = false;

  // StringBuffer message = StringBuffer("no auth");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ImageUploadWidget(),
            const AuthDemo(),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Go to Home Page'),
            ),
          ],
        )
      ),
    );
  }
}
