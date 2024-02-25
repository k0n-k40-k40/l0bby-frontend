import 'package:flutter/material.dart';
import '../components/stars_rating.dart';

class CourtInfo extends StatelessWidget {
  final String name;
  final String address;
  final double rating;
  final String phoneNumber;

  const CourtInfo ({
    super.key,
    required this.name,
    required this.address,
    required this.rating,
    required this.phoneNumber
  });

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.normal
            ),
          ),
          Text(
            address,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 13
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: StarRating(
              rating: rating
            ),
          )
        ],
      );
  }
}


_showNotification(BuildContext context, String phoneNumber) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Notification'),
        content: Text('Do you want to call $phoneNumber?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

class CallButton extends StatelessWidget {
  final String phoneNumber;

  const CallButton({
    super.key,
    required this.phoneNumber
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {
          _showNotification(context, phoneNumber),
        },
        child: const Text(
          "Book this court!!",
        )
      );
  }

}
class BookingPage extends StatelessWidget {
  final String backgroundFileName;
  final CourtInfo courtInfo;

  const BookingPage({
    Key? key,
    required this.backgroundFileName,
    required this.courtInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            backgroundFileName,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Content on top of the background image goes from here down
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: CallButton(phoneNumber: courtInfo.phoneNumber),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: courtInfo,
              )
            ],
          ),
        ],
      ),
    );
  }
}
