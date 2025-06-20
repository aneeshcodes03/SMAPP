import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 60, 60, 60),
    primary: const Color.fromARGB(255, 60, 60, 60),
    secondary: const Color.fromARGB(255, 60, 60, 60),
    inversePrimary: const Color.fromARGB(255, 195, 195, 195),
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: const Color.fromARGB(255, 0, 0, 0),
    displayColor: Colors.black,
  ),
);
