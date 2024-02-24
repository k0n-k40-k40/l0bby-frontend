import 'package:flutter/material.dart';
import 'src/screens/booking_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home: BookingPage(
        backgroundFileName: 'lib/assets/courts/court_1.jpg',
        courtInfo: CourtInfo(
          name: "Sân Cầu Lông Cao Lỗ",
          address: "45 Cao Lỗ, Phương 4, Quận 8, Thành phố Hồ Chí Minh",
          rating: 3.5,
          phoneNumber: "09090909090",
          ),
      )
    );
  }
}
