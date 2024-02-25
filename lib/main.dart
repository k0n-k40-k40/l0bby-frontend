// main.dart
// main.dart
import 'package:flutter/material.dart';
import 'src/app_router.dart'; // Import the AppRouter
import 'styles/app_theme.dart'; // Import the theme

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      onGenerateRoute: AppRouter.generateRoute, // Use the AppRouter
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('404'),
            ),
            body: const Center(
              child: Text('404: Not Found'),
            ),
          ),
        );
      },
      theme: AppTheme.lightTheme,
    );
  }
}
