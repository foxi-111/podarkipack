import 'package:flutter/material.dart';

class ColorStyle {
  static const Gradient gradient = LinearGradient(
    colors: [
      Color.fromRGBO(255, 153, 123, 1), // первый цвет
      Color.fromRGBO(255, 136, 255, 1), // второй цвет
    ],
    stops: [0.0, 1.0], // точки, на которых переходит градиент
  );

  static const Color backgrounds = Color.fromRGBO(255, 255, 255, 1);
  static const Color theTextIsGray = Color.fromRGBO(130, 130, 130, 1);
  static const Color textAccent = Color.fromRGBO(255, 0, 0, 1);
}
