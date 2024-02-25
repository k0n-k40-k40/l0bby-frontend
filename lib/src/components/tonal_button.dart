import 'package:flutter/material.dart';

class TonalButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;

   TonalButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 220,
          minHeight: 40
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          ),
          child:
            Text(
              text,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontFamily: 'gomarice_goma_block',
                fontWeight: FontWeight.w100,
                fontSize: 20
              ),
            ),
        )
      )
    );
  }
}
