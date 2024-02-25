import 'package:flutter/material.dart';

class FindingRoomScreen extends StatefulWidget {
  const FindingRoomScreen({super.key});

  @override
  State<FindingRoomScreen> createState() => _FindingRoomScreenState();
}

class _FindingRoomScreenState extends State<FindingRoomScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/lobby');
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
            const Text('Finding Room', style: TextStyle(color: Colors.white)),
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
              'Looking for a suitable room...',
              style:
                  TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
