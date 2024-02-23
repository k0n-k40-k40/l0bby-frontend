import 'package:flutter/material.dart';
import 'tonal_button.dart';

class AllModeButtons extends StatelessWidget {
  const AllModeButtons({
    Key ? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TonalButton(
            text: "Automatic!", 
            backgroundColor: Colors.lightBlueAccent, 
            onPressed: () {
            
            },
          ),
          TonalButton(
            text: "Manual!", 
            backgroundColor: Colors.lightBlueAccent, 
            onPressed: () {

            },
          ),
          TonalButton(
            text: "Creat Room!", 
            backgroundColor: Colors.lightBlueAccent, 
            onPressed: () {

            },
          )
        ],
      ),
    );
  }
}