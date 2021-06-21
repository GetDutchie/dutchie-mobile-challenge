import 'dart:ui';
import 'package:flutter/material.dart';

class AppTheme {
  static Color get primaryGreen => Color(0xFF26A27B);
  static Color get primaryBlack => Color(0xFF242526);

  static MaterialColor get green => MaterialColor(
        primaryGreen.value,
        <int, Color>{
          95: Color(0xFFf0fffa),
          65: Color(0xFF86c1ab),
          40: Color(0xFF26A27B),
        },
      );

  static String get proximaNovaFontFamily => 'Proxima Nova';

  static ThemeData get themeData => ThemeData(
        primaryColor: primaryGreen,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: proximaNovaFontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 13,
            height: 1.65,
            color: primaryBlack,
          ),
          bodyText2: TextStyle(
            fontFamily: proximaNovaFontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 1.65,
            color: primaryBlack,
          ),
          subtitle1: TextStyle(
            fontFamily: proximaNovaFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 13,
            height: 1.12,
            color: primaryBlack,
          ),
          subtitle2: TextStyle(
            fontFamily: proximaNovaFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 11,
            height: 1.5,
            color: primaryBlack,
          ),
          headline3: TextStyle(
            fontFamily: proximaNovaFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            height: 1.2,
            color: primaryBlack,
          ),
          headline4: TextStyle(
            fontFamily: proximaNovaFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            height: 1.2,
            color: primaryBlack,
          ),
          headline5: TextStyle(
            fontFamily: proximaNovaFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            height: 1.75,
            color: primaryBlack,
          ),
          headline6: TextStyle(
            fontFamily: proximaNovaFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 12,
            height: 1.5,
            color: primaryBlack,
          ),
        ),
      );
}
