import 'dart:ui';
import 'package:flutter/material.dart';

class AppTheme {
  static Color get primaryGreen => Color(0xFF26A27B);

  static MaterialColor get green => MaterialColor(
        primaryGreen.value,
        <int, Color>{
          95: Color(0xFFf0fffa),
          65: Color(0xFF86c1ab),
        },
      );

  static ThemeData get themeData => ThemeData(
        primaryColor: primaryGreen,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.65,
          ),
          bodyText2: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            height: 1.65,
          ),
        ),
      );
}
