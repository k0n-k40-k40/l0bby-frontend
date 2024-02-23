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

class HomeImage extends StatefulWidget {
  const HomeImage({
    Key? key,
    required this.source,
  }) : super(key: key);

  final String source;

  @override
  _HomeImageState createState() => _HomeImageState();
}


class _HomeImageState extends State<HomeImage>
  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween(begin: -15.0, end: 15.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0.0, _animation.value),
              child: Image.asset(
                widget.source, // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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