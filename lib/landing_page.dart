import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("l0bby"),
      ),
      backgroundColor: const Color.fromARGB(255, 74, 91, 106),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HelloBar(username: "duy"),
            SizedBox(height: 20,),
            HomeImage(source: "lib/assets/running_tree.png"),
          ]
        )
      ),
    );   
  }
}

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
          style: TextStyle(fontSize: textSize, ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class HomeImage extends StatelessWidget {
  const HomeImage({
    Key? key,
    required this.source,
  }) : super(key: key);

  final String source;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(),
      child: Center(
        child: Image.asset((source)),
      ),
    );
  }
}

// class AllModeButtons extends StatelessWidget {
//   const AllModeButtons({
//     Key ? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column()
//   }

// }