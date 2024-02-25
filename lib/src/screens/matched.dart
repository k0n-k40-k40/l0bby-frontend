// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class MatchedPage extends StatefulWidget {
  const MatchedPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MatchedPageState createState() => _MatchedPageState();
}

class _MatchedPageState extends State<MatchedPage> {
  final List<Map<String, dynamic>> members = [
    {'name': 'Trường'},
    {'name': 'Duy'},
    {'name': 'Quân'},
    {'name': 'Bảo'},
    {'name': 'Thuý'},
    {'name': 'Hà'},
    {'name': 'Thắng'},
    {'name': 'Hải'},
    {'name': 'Ngọc'},
    {'name': 'Bình'},
    {'name': 'Phát'},
  ];
  final List<Color> avatarColors = [
    Colors.brown,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];
  String sportName = "Cầu lông";
  String locationName = "Sân Cầu Lông Cao Lỗ";
  String time = "14:00 PM - 15:00 PM";
  String date = "25/02/2024";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF333333),
        title: const Text("Trận đấu", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLobbyInfoSection(),
            _buildMembersSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your chat button logic here
        },
        child: const Icon(Icons.chat),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to /booking
            Navigator.pushNamed(context, '/booking');
          },
          child: const Text(
            "Đặt sân ngay",
            style: TextStyle(fontSize: 18.0),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF9B40BF), // Text color
            minimumSize: const Size(double.infinity, 60), // Button size
          ),
        ),
      ),
    );
  }

  Widget _buildLobbyInfoSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Thông tin trận đấu",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Card(
            color: const Color(0xFF1E1E1E),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.sports_tennis, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        "Môn thi đấu: $sportName",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        "Địa điểm: $locationName",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        "Thời gian: $time",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        "Ngày: $date",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Thành viên",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        ...members.map((member) {
          Color avatarColor =
              avatarColors[members.indexOf(member) % avatarColors.length];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: avatarColor,
              child: Text(
                member['name'][0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              member['name'],
              style: const TextStyle(color: Colors.white),
            ),
          );
        }),
      ],
    );
  }
}
