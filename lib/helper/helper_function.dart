import 'package:flutter/material.dart';
//disiplay error message to user

void displayMessageToUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(title: Text(message)),
  );
}
