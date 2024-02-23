import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String profileId;

  const ProfilePage({super.key, required this.profileId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Text('Profile ID: $profileId'),
      ),
    );
  }

  // Static method to extract arguments
  static ProfilePage fromRouteSettings(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>;
    return ProfilePage(profileId: args['profileId']);
  }
}
