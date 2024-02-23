import 'package:flutter/material.dart';
import 'tonal_button.dart';

class AllModeButtons extends StatelessWidget {
  const AllModeButtons({
    Key ? key,
  }) : super(key: key);

  BoxDecoration myBoxDecoration() {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0)
      ),
      color: Color.fromRGBO(255, 255, 255, 0.4),
    );
  }



  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.3,
        decoration: myBoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TonalButton(
              text: "Automatic!", 
              backgroundColor: Colors.lightBlueAccent, 
              onPressed: () {
                Navigator.pushNamed(context, '/automatic');
              },
            ),
            TonalButton(
              text: "Manual!", 
              backgroundColor: const Color.fromRGBO(64, 196, 255, 1), 
              onPressed: () {
                Navigator.pushNamed(context, '/manual');

              },
            ),
            TonalButton(
              text: "Create Room!", 
              backgroundColor: Colors.lightBlueAccent, 
              onPressed: () {

              },
            ),
            TonalButton(
              text: "Go to auth page!", 
              backgroundColor: Colors.lightBlueAccent, 
              onPressed: () {
                Navigator.pushNamed(context, '/auth');
              },
            )
          ],
        ),
      ),
    );
  }
}