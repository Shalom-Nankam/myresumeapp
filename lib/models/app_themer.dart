import 'package:flutter/material.dart';

class MyAppThemer {
  static const primary = String.fromEnvironment('Primary');
  static const secondary = String.fromEnvironment('Secondary');
  static const tertiary = String.fromEnvironment('Tertiary');

  static Color primaryColor() {
    return Color(int.parse(primary, radix: 16) + 0xff000000);
  }

  static Color secondaryColor() {
    return Color(int.parse(secondary, radix: 16) + 0xff000000);
  }

  static Color tertiaryColor() {
    return Color(int.parse(tertiary, radix: 16) + 0xff000000);
  }
}
