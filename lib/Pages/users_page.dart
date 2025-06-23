import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [Icon(Icons.image)],
      ),
    );
  }
}
