import 'package:flutter/material.dart';
import 'src/components/hello_bar.dart';
import 'src/components/animation_image.dart';
import 'src/components/all_buttons.dart';
// import 'package:l0bby_frontend/navigation_bar.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("l0bby"),
      ),
      backgroundColor: Color.fromARGB(255, 191, 214, 233),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HelloBar(username: "duy"),
            SizedBox(height: 5,),
            HomeImage(source: "lib/assets/running_tree.png"),
            SizedBox(height: 5,),
            AllModeButtons()
          ]
        )
      ),
    );   
  }
}
