// app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Light theme definition
 ThemeData lightTheme(BuildContext context) { return ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: Colors.white,
  hintColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white),

  ),
  textTheme: GoogleFonts.latoTextTheme(
    Theme.of(context).textTheme,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
);}

// Dark theme definition
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  hintColor: Colors.blueAccent,
  scaffoldBackgroundColor: Colors.grey[850],
  appBarTheme: AppBarTheme(
    color: Colors.grey[900],
    iconTheme: IconThemeData(color: Colors.black),

  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueAccent,
    textTheme: ButtonTextTheme.primary,
  ),
);
