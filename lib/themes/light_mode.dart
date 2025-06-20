import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.white,
    secondary: Colors.white,
    inversePrimary: const Color.fromARGB(255, 0, 0, 0),
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: const Color.fromARGB(255, 0, 0, 0),
    displayColor: Colors.black,
  ),
);
