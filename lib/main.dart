import 'package:flutter/material.dart';
import 'package:smapp/Pages/login_page.dart';
import 'package:smapp/themes/dark_mode..dart';
import 'package:smapp/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: lightmode,
      darkTheme: darkmode,
      themeMode: ThemeMode.light,
    );
  }
}
