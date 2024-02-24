import 'package:flutter/material.dart';
import 'src/components/image_uploader.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: AuthDemo(),
        ),
      ),
    );
  }
}