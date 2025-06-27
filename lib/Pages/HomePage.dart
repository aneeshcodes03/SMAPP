import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smapp/components/my_drawer.dart';
import 'package:smapp/components/my_textfield.dart';
import 'package:smapp/components/post_field.dart';
import 'package:smapp/database/firestore.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirestoreDatabase database = FirestoreDatabase();
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  final TextEditingController postcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("SocialBoard 🗣️"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout)),
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          // textfield for user
          Expanded(child: PostField()),

          // display posts from database to the app
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              // loading circle
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              // get posts
              final posts = snapshot.data!.docs;
              // no data ?
              if (snapshot.data == null || posts.isEmpty) {
                return Center(child: Text("Nothing to show"));
              }
              // return as a list
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    // get indivudual post
                    final post = posts[index];
                    // get data frome each posts
                    String message = post['PostMessage'];
                    String email = post['UserEmail'];
                    Timestamp timestamp = post['TimeStamp'];
                    // return as a listtile

                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              email,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
