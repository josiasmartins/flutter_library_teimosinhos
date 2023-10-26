library tut_input_field;
import 'package:flutter/material.dart';

class TutInputField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final double inputWidth;

  TutInputField({
    required this.labelText,
    this.obscureText = false,
    required this.inputWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: inputWidth,
      padding: EdgeInsets.all(10),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Color(0xFFF1F5F4), // Cor F1F5F4
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(31.0),
            borderSide: BorderSide.none, // Nenhuma borda
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(31.0),
            borderSide: BorderSide.none, // Nenhuma borda
          ),
        ),
      ),
    );
  }
}
