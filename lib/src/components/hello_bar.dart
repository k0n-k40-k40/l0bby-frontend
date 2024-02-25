import 'package:flutter/material.dart';

class HelloBar extends StatelessWidget {
  const HelloBar({
    Key? key,
    required this.username,
  }) : super(key: key);

  final String username;

  BoxDecoration myBoxDecoration() {
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),

    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textSize = screenWidth * 0.07;

    return ConstrainedBox(
      constraints: const BoxConstraints(),

      child: Container(
        decoration: myBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "l0bby",
            style: TextStyle(fontFamily: 'INVASION2000', fontSize: textSize * 2, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
