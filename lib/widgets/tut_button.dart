import 'package:flutter/material.dart';

class TutButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  // final double buttonWidth;
  final Function onPressed;

  TutButton({
    required this.buttonText,
    required this.buttonColor,
    // required this.buttonWidth,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(31.0),
            ),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
