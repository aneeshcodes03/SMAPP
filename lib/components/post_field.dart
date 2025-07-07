import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smapp/components/my_drawer.dart';
import 'package:smapp/components/my_textfield.dart';
import 'package:smapp/database/firestore.dart';

class PostField extends StatefulWidget {
  const PostField({super.key, required});

  @override
  State<PostField> createState() => _HomepageState();
}

class _HomepageState extends State<PostField> {
  final TextEditingController postController = TextEditingController();
  final FirestoreDatabase database = FirestoreDatabase();

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  void postMessage() {
    final message = postController.text.trim();
    if (message.isNotEmpty) {
      // TODO: Upload message to Firestore or your backend
      database.addPost(message);
      postController.clear();
    }
  }

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 🔷 POST COMPOSER
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "What's on your mind?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: postController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        hintText: "Write something...",
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton.icon(
                        onPressed: postMessage,
                        icon: const Icon(Icons.send),
                        label: const Text("Post"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              // TODO: Add posts below
              const Text("🔽 Recent Posts will appear here 🔽"),
            ],
          ),
        ),
      ),

      // Padding(

      //  ),
    );
  }
}
