import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:smapp/components/my_button.dart';
import 'package:smapp/components/my_textfield.dart';
import 'package:smapp/helper/helper_function.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔵 Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // 💎 Glassmorphic Login Card
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 🎯 Logo/Icon
                      const Icon(
                        Icons.lock_outline,
                        size: 70,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 20),

                      // 🆔 Title
                      const Text(
                        "Welcome to SMAPP",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 25),

                      // 📧 Email Field
                      MyTextfield(
                        hinttext: "Email",
                        obscureText: false,
                        controller: emailController,
                      ),
                      const SizedBox(height: 15),

                      // 🔒 Password Field
                      MyTextfield(
                        hinttext: "Password",
                        obscureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 10),

                      // ❓ Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {}, // Add action later
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // 🔘 Login Button
                      MyButton(text: "Login", onTap: login),
                      const SizedBox(height: 15),

                      // 🆕 Register Prompt
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.white70),
                          ),
                          TextButton(
                            onPressed: widget.onTap,
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
