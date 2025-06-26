import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smapp/Pages/profile_page.dart';
import 'package:smapp/Pages/users_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header
              DrawerHeader(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Closes the drawer
                  },
                  child: Icon(Icons.arrow_back),
                ),
              ),

              const SizedBox(height: 25),
              // home tile
              ListTile(
                leading: Icon(Icons.home),
                title: Text("HOME"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // profile tile
              Padding(
                padding: EdgeInsets.all(1),
                child: ListTile(
                  leading: Icon(Icons.verified_user),
                  title: Text("PROFLE"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
              ),

              // users tile
              ListTile(
                leading: Icon(Icons.account_box_outlined),
                title: Text("USERS"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UsersPage()),
                  );
                },
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              leading: Icon(Icons.logout_sharp),
              title: Text("LOGOUT"),
              onTap: () {
                logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
