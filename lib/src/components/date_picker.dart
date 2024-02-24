/*
this is a container class with width = 300, height = 30
*/

import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({ super.key });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _selectedDate = DateTime.now();
  bool isUserChoose = false;

  Future<void> _selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null && selectedDate != _selectedDate) {
      setState(() {
        _selectedDate = selectedDate;
        isUserChoose = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String displayText = "pick a date!";

    if (isUserChoose) {
      String year = _selectedDate.year.toString();
      String month = _selectedDate.month.toString();
      String day = _selectedDate.day.toString();

      if (month.length < 2) month = '0$month';
      if (day.length < 2) day = '0$day';

      displayText = '$day/$month/$year';
    }

    return 
      Container(
        height: 30,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12, 
            width: 2
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(displayText),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
                foregroundColor: Colors.white, // Text color
              ),
              child: const Text('Select Date'),
            ),
          ),
        ],
      ),
    );
  }
}
