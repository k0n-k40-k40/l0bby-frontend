// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  final List<String> friends = ['Alice', 'Bob', 'Charlie'];
  List<String> filteredFriends = [];
  final List<String> invitedFriends = []; // List to track invited friends
  final List<Map<String, dynamic>> members = [
    {'name': 'Trường', 'isReady': true},
    {'name': 'Duy', 'isReady': true},
    {'name': 'Quân', 'isReady': true},
    {'name': 'Bảo', 'isReady': true},
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
  String locationName = "Công viên Tao Đàn";
  String time = "10:00 AM - 12:00 PM";
  String date = "01/01/2024";

  String roomCode = "242271012badminton";
  @override
  void initState() {
    super.initState();
    filteredFriends = friends; // Initially, all friends are shown
  }

  @override
  Widget build(BuildContext context) {
    bool allReady = members.every((member) => member['isReady'] == true);

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF333333),
        title: const Text("Room 345", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(
            color: Colors.white), // Ensure back arrow is white
        actions: [
          IconButton(
            icon: const Icon(Icons.edit,
                color: Colors.white), // Set the icon color to white
            onPressed: () => _showEditRoomModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your content here
            RoomCode(roomCode: roomCode),
            _buildLobbyInfoSection(),
            _buildFriendsSection(context),
            _buildMembersSection(),
            if (!allReady) // Conditionally show warning text
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Còn người chơi chưa sẵn sàng',
                  style: TextStyle(fontSize: 14.0, color: Colors.redAccent),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: allReady
                ? () {
                    // Action for starting the match
                    Fluttertoast.showToast(
                      msg: 'Starting Match...',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                    // Navigate to finding match page
                    Navigator.pushNamed(context, '/finding');
                  }
                : null,
            child: Text(
              "Tìm trận đấu",
              style: TextStyle(
                  color: allReady ? Colors.white : Colors.grey,
                  fontSize:
                      18.0), // Set font color to white if everyone is ready, otherwise set it to grey
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  allReady ? const Color(0xFF9B40BF) : const Color(0xFF333333),
              minimumSize: const Size(
                  double.infinity, 80), // Make button wider and taller
              elevation: 8, // Add elevation for floating effect
              shadowColor: Colors.black.withOpacity(0.4), // Set shadow color
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the chat page
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChatPage()));
        },
        child: const Icon(Icons.chat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, // Place the chat button to the bottom right
    );
  }

  Widget _buildFriendsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton(
          onPressed: () {
            _showFriendsModal(context);
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: Colors.white),
              SizedBox(width: 8),
              Text(
                "Mời bạn bè",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xFF9B40BF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            side: const BorderSide(
              color: Color(0xFF9B40BF),
              width: 2,
            ),
          ),
        ),
      ],
    );
  }

  void _showEditRoomModal(BuildContext context) {
    // Temporary variables to hold the potential new values
    String tempSportName = sportName;
    String tempLocationName = locationName;
    String tempTime = time;
    String tempDate = date;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Môn thi đấu"),
                controller: TextEditingController(text: tempSportName),
                onChanged: (value) => tempSportName = value,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(labelText: "Địa điểm"),
                controller: TextEditingController(text: tempLocationName),
                onChanged: (value) => tempLocationName = value,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(labelText: "Thời gian"),
                controller: TextEditingController(text: tempTime),
                onChanged: (value) => tempTime = value,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(labelText: "Ngày"),
                controller: TextEditingController(text: tempDate),
                onChanged: (value) => tempDate = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Use setState to update the main state variables
                    setState(() {
                      sportName = tempSportName;
                      locationName = tempLocationName;
                      time = tempTime;
                      date = tempDate;
                    });
                    Navigator.pop(context); // Dismiss the modal
                  },
                  child: const Text("Cập nhật"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                        double.infinity, 60), // Make button wider and taller
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFriendsModal(BuildContext context) {
    String searchQuery = "";
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 300,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Text(
                    "Danh sách bạn bè",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        setModalState(() {
                          searchQuery = value.toLowerCase();
                          filteredFriends = friends
                              .where((friend) =>
                                  friend.toLowerCase().contains(searchQuery))
                              .toList();
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: "Search",
                        hintText: "Search for a friend's name",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredFriends.length,
                      itemBuilder: (context, index) {
                        final friend = filteredFriends[index];
                        final alreadyInvited = invitedFriends.contains(friend);

                        // Cycle through avatarColors based on friend's index
                        Color avatarColor =
                            avatarColors[index % avatarColors.length];

                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: avatarColor,
                            child: Text(
                              friend[
                                  0], // Display the first letter of the friend's name
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(friend),
                          trailing: ElevatedButton(
                            onPressed: alreadyInvited
                                ? null
                                : () {
                                    setState(() {
                                      invitedFriends.add(friend);
                                    });
                                    setModalState(() {});
                                    Fluttertoast.showToast(
                                      msg: "Invited $friend",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                    );
                                  },
                            child: Text(alreadyInvited ? "Invited" : "Invite"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: alreadyInvited
                                  ? Colors.grey
                                  : Colors.blueAccent,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
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
              "Thông tin phòng",
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
    // Calculate the number of empty slots needed.
    int emptySlots = 10 - members.length;

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
        ...members.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> member = entry.value;
          Color avatarColor = avatarColors[index % avatarColors.length];

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
            trailing: member['isReady']
                ? const Icon(Icons.check_circle, color: Colors.green)
                : const Icon(Icons.cancel, color: Colors.red),
          );
        }),
        // Display empty slots if needed.
        for (var i = 0; i < emptySlots; i++)
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: const Icon(Icons.person_outline, color: Colors.white54),
            ),
            title: const Text(
              "Chờ...",
              style: TextStyle(color: Colors.white54),
            ),
          ),
      ],
    );
  }
}

class RoomCode extends StatelessWidget {
  const RoomCode({
    super.key,
    required this.roomCode,
  });

  final String roomCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                children: [
                  const TextSpan(
                    text: "Room Code: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: roomCode,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.copy, color: Colors.white),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: roomCode)).then((_) {
                Fluttertoast.showToast(
                  msg: "Room code copied to clipboard",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              });
            },
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: const Center(child: Text("Chat Page")),
      backgroundColor: Colors.black, // Set the background color to black
    );
  }
}
