import 'package:flutter/material.dart';

class HexColor {
  
  static Color hexToColor(String code) {
    
    if (code[0] == '#') {
      code = code.substring(1);
    }

    if (code.length != 6) {
      throw ArgumentError("O código hexadecimal deve ter 6 caracteres.");
    }

    return Color(int.parse('FF$code', radix: 16));
  }
}
