import 'package:flutter/material.dart';

class FindingMatchScreen extends StatefulWidget {
  const FindingMatchScreen({super.key});

  @override
  State<FindingMatchScreen> createState() => _FindingMatchScreenState();
}

class _FindingMatchScreenState extends State<FindingMatchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/matched');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF333333),
        title:
            const Text('Finding Match', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              strokeWidth: 6.0,
            ),
            const SizedBox(
                height:
                    24), // Provides some spacing between the CircularProgressIndicator and the text
            Text(
              'Looking for opponents...',
              style:
                  TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
