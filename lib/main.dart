import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smapp/Pages/login_page.dart';
import 'package:smapp/Pages/register_page.dart';
import 'package:smapp/Pages/screen_splash.dart';
import 'package:smapp/auth/auth.dart';
import 'package:smapp/auth/login_or_register.dart';
import 'package:smapp/firebase_options.dart';
import 'package:smapp/themes/dark_mode..dart';
import 'package:smapp/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: lightmode,
      darkTheme: darkmode,
      themeMode: ThemeMode.light,
    );
  }
}
