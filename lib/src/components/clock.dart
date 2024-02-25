import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ClockWidget extends StatelessWidget {
  final DateTime dateTime;

  const ClockWidget({
    super.key,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Date container
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color:  Color.fromARGB(233, 16, 13, 24),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${dateTime.day}',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  DateFormat.MMM().format(dateTime).toUpperCase(),
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w100
                  ),
                ),
              ],
            ),
          ),
        ),
        // Time container
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start, // Left-align text
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      DateFormat('hh', 'en_US').format(dateTime),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      DateFormat(':mm', 'en_US').format(dateTime),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.normal,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      DateFormat('a', 'en_US').format(dateTime).toLowerCase(),
                      style: GoogleFonts.roboto(fontSize: 20),
                    ),
                  ],
                ),
                Text('FROM', style: GoogleFonts.roboto(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                    fontWeight: FontWeight.w300
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
