import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [Icon(Icons.image)],
      ),
    );
  }
}
