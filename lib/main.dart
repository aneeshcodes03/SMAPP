import 'package:flutter/material.dart';
import 'package:smapp/Pages/login_page.dart';
import 'package:smapp/Pages/register_page.dart';
import 'package:smapp/auth/login_or_register.dart';
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
      home: const LoginOrRegister(),
      theme: lightmode,
      darkTheme: darkmode,
      themeMode: ThemeMode.light,
    );
  }
}
