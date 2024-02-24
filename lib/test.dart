import 'package:flutter/material.dart';
import 'src/components/date_picker.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: DatePicker(width: 300, height: 50, radius: 30,),
        ),
      ),
    );
  }
}