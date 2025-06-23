import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: const Color.fromARGB(255, 153, 153, 153),
    secondary: Colors.white,
    inversePrimary: const Color.fromARGB(255, 213, 213, 213),
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: const Color.fromARGB(255, 0, 0, 0),
    displayColor: const Color.fromARGB(255, 103, 103, 103),
  ),
);
