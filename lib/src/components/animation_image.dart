import 'package:flutter/material.dart';

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
    _animation = Tween(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      Transform.scale(
        scale: 1,
        child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0.0, _animation.value),
                child: Image.asset(
                  widget.source, // Replace with your image asset path
                  fit: BoxFit.contain,
                ),
            );
          },
        ),
       ),
      );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}