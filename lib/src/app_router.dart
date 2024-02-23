// app_router.dart
import 'package:flutter/material.dart';
import 'package:l0bby_frontend/src/screens/auto_match.dart';
import 'package:l0bby_frontend/src/screens/manual_match.dart';
import 'screens/auth.dart';
import 'screens/room_details.dart';
import 'screens/home.dart';
import 'screens/user_profile.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case '/manual':
        return MaterialPageRoute(builder: (_) => const ManualMatchScreen());
      case '/automatic':
        return MaterialPageRoute(builder: (_) => const AutoMatchScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      // Add more static routes here
    }

    // Handling dynamic routes
    if (settings.name!.startsWith('/manual/room/')) {
      final roomId = settings.name!.substring('/manual/room/'.length);
      return MaterialPageRoute(builder: (_) => RoomDetailsPage(roomId: roomId));
    }
    // if (settings.name == '/profile') {
    //   return MaterialPageRoute(
    //       builder: (_) => ProfilePage.fromRouteSettings(settings));
    // }
    // Fallback for unknown routes
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('404: Not Found')),
      ),
    );
  }
}
