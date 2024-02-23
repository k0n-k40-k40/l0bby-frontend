import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/hello_bar.dart';
import '../components/animation_image.dart';
import '../components/all_buttons.dart';
// import 'package:l0bby_frontend/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 214, 233),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded( // other elements of home page
              child: Column(
                children: [
                  HelloBar(username: "duy"),
                  HomeImage(source: "lib/assets/running_tree.png"),
                ],
              ),
            ),
            AllModeButtons() // button sections of homepage -> routing in here
          ]
        )
      ),
    );   
  }
}
