// app_router.dart
import 'package:flutter/material.dart';
import 'package:l0bby_frontend/src/screens/login.dart';
import 'package:l0bby_frontend/src/screens/room_list.dart';
import 'screens/auth.dart';
import 'screens/room_details.dart';
import 'screens/home.dart';
import 'screens/user_profile.dart';
import 'screens/lobby.dart';
import 'screens/finding_match.dart';
import 'screens/matched.dart';
import 'screens/lobby_manual.dart';
import 'screens/finding_room.dart';
import 'screens/booking_page.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case '/manual/room_list':
        return MaterialPageRoute(builder: (_) => const RoomListScreen());
      case '/automatic':
        return MaterialPageRoute(builder: (_) => const LobbyPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/lobby':
        return MaterialPageRoute(builder: (_) => const LobbyPage());
      case '/finding':
        return MaterialPageRoute(builder: (_) => const FindingMatchScreen());
      case '/matched':
        return MaterialPageRoute(builder: (_) => const MatchedPage());
      case '/lobby_manual':
        return MaterialPageRoute(builder: (_) => const LobbyManualScreen());
      case '/finding_room':
        return MaterialPageRoute(builder: (_) => const FindingRoomScreen());
      case '/booking':
        return MaterialPageRoute(
            builder: (_) => BookingPage(
                  backgroundFileName: 'lib/assets/courts/court_1.jpg',
                  courtInfo: CourtInfo(
                    name: "Sân Cầu Lông Cao Lỗ",
                    address:
                        "45 Cao Lỗ, Phương 4, Quận 8, Thành phố Hồ Chí Minh",
                    rating: 3.5,
                    phoneNumber: "09090909090",
                    dateTime: DateTime(2024, 2, 25, 14, 00),
                  ),
                ));
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
