import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hinttext;
  final bool obscureText;
  final TextEditingController controller;
  const MyTextfield({
    super.key,
    required this.hinttext,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        hintText: hinttext,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      //obscureText: true,
    );
  }
}
