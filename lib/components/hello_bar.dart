import 'package:flutter/material.dart';

class HelloBar extends StatelessWidget {
  const HelloBar({
    Key? key,
    required this.username,
  }) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textSize = screenWidth * 0.07;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        // minHeight: 100, 
      ),
      child: Container (
        color: Colors.red,
        child: Text(
          "hello, $username!!\n Lets play some games!!",
          style: TextStyle(
            fontSize: textSize, 
            fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}