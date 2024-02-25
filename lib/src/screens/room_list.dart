// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import '../components/navigation_bar.dart';

class RoomListScreen extends StatelessWidget {
  const RoomListScreen({super.key});

  void _showJoinRoomDialog(BuildContext context) {
    final TextEditingController _roomCodeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Join a Room'),
          content: TextField(
            controller: _roomCodeController,
            decoration: const InputDecoration(hintText: 'Enter room code'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Join'),
              onPressed: () {
                Navigator.pushNamed(context, '/lobby_manual');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> rooms = [
      {
        'id': 123,
        'sportName': 'Cầu lông',
        'location': 'Trung tâm thể dục A',
        'startTime': '10:00',
        'endTime': '12:00',
        'date': '22/10/2023',
      },
      {
        'id': 345,
        'sportName': 'Cầu lông',
        'location': 'Công viên Tao Đàn',
        'startTime': '10:00',
        'endTime': '12:00',
        'date': '01/01/2024',
      },
      {
        'id': 546,
        'sportName': 'Bóng đá',
        'location': 'Sân vận động B',
        'startTime': '15:00',
        'endTime': '17:00',
        'date': '23/10/2023',
      },
      {
        'id': 779,
        'sportName': 'Bóng rổ',
        'location': 'Trung tâm thể dục C',
        'startTime': '13:00',
        'endTime': '15:00',
        'date': '24/10/2023',
      },
      {
        'id': 101,
        'sportName': 'Quần vợt',
        'location': 'Sân quần vợt D',
        'startTime': '08:00',
        'endTime': '10:00',
        'date': '25/10/2023',
      },
      {
        'id': 202,
        'sportName': 'Bóng chuyền',
        'location': 'Trung tâm thể dục E',
        'startTime': '18:00',
        'endTime': '20:00',
        'date': '26/10/2023',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF333333),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Danh sách phòng', style: TextStyle(color: Colors.white)),
            Text(
              'Các hoạt động thể thao đang diễn ra',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(value: 0, child: Text('Option 1')),
              const PopupMenuItem<int>(value: 1, child: Text('Option 2')),
            ],
            onSelected: (item) => {
              // Handle item selection
            },
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(currentIndex: 2),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showJoinRoomDialog(context),
        child: const Icon(Icons.vpn_key),
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: rooms.length,
        separatorBuilder: (_, __) => const Divider(color: Colors.grey),
        itemBuilder: (context, index) {
          final room = rooms[index];
          return Card(
            color: const Color(0xFF333333),
            child: ListTile(
              onTap: () {
                // navigate to /lobby
                Navigator.pushNamed(context, '/lobby_manual');
              },
              leading: Text(
                '#${room['id']}',
                style: const TextStyle(color: Colors.white, fontSize: 14),
                overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
              ),
              title: Text(
                'Chơi ${room['sportName']} tại ${room['location']}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
                overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                maxLines: 1, // Ensure title is limited to a single line
              ),
              subtitle: Text(
                '${room['startTime']} -> ${room['endTime']} ${room['date']}',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
                overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                maxLines: 2, // Allow for two lines in the subtitle
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          );
        },
      ),
    );
  }
}
