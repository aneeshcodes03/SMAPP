import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smapp/auth/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait for 5 seconds then navigate to Auth Page
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SMAPP",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Let's connect",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
