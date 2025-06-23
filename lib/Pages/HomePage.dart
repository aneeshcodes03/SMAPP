import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smapp/components/my_drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home")),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 1,
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      drawer: MyDrawer(),
    );
  }
}
