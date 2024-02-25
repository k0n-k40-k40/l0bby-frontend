import 'package:flutter/material.dart';
import '../components/stars_rating.dart';
import '../components/clock.dart';


class CourtInfo extends StatelessWidget {
  final String name;
  final String address;
  final double rating;
  final String phoneNumber;
  final DateTime dateTime;


  const CourtInfo ({
    super.key,
    required this.name,
    required this.address,
    required this.rating,
    required this.phoneNumber,
    required this.dateTime,
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
        title: const Text('Notification'),
        content: Text('Do you want to call $phoneNumber?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

class MyInk extends StatelessWidget {
  final Widget child;

  const MyInk({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.green], // Gradient colors
          begin: Alignment.centerLeft, // Gradient begin alignment
          end: Alignment.centerRight, // Gradient end alignment
        ),
        borderRadius: BorderRadius.circular(30), // Same border radius as the button
      ),
      child: child,
    );
  }
}

class CallButton extends StatelessWidget {
  final String phoneNumber;

  const CallButton({
    super.key,
    required this.phoneNumber
  });

  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton (
        onPressed: () => {
          _showNotification(context, phoneNumber),
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 26, 125, 207).withOpacity(0.9),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.normal,
          ),
          elevation: 3,
        ),
        child: MyInk(
          child: Container(
            constraints: const BoxConstraints(minWidth: 88, minHeight: 45),
            alignment: Alignment.center,
            child: const Text(
              'Book this court!!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ),
      );
  }

}
class BookingPage extends StatelessWidget {
  final String backgroundFileName;
  final CourtInfo courtInfo;

  const BookingPage({
    super.key,
    required this.backgroundFileName,
    required this.courtInfo,
  });

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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: CallButton(phoneNumber: courtInfo.phoneNumber),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 20, right: 20), child:
                    Container(
                      alignment: Alignment.centerLeft,
                      constraints: const BoxConstraints(maxWidth: 300, minHeight: 50),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: ClockWidget(dateTime: courtInfo.dateTime,
                      ),
                    )
                  ,)
                ]
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
