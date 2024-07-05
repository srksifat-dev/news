import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color(0xff888888),
        ),
        titleTextStyle: TextStyle(
          color: Color(0xff888888),
          fontSize: 18,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      splashColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.black,
      ),
    );
  }
}
