import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smapp/components/my_drawer.dart';
import 'package:smapp/components/post_field.dart';
import 'package:smapp/database/firestore.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirestoreDatabase database = FirestoreDatabase();
  final currentUserEmail = FirebaseAuth.instance.currentUser?.email;

  void logout() {
    FirebaseAuth.instance.signOut();
  }

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
      drawer: const MyDrawer(),
      body: Column(
        children: [
          const Expanded(child: PostField()),
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final posts = snapshot.data?.docs ?? [];

              if (posts.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text("Nothing to show"),
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    final postId = post.id;

                    String message = post['PostMessage'];
                    String email = post['UserEmail'];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 4,
                      ),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: Theme.of(context).cardColor,
                      shadowColor: Theme.of(
                        context,
                      ).shadowColor.withOpacity(0.3),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.surfaceVariant,
                              Theme.of(context).colorScheme.surface,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (currentUserEmail == email)
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline_rounded,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    final shouldDelete = await showDialog<bool>(
                                      context: context,
                                      builder:
                                          (context) => AlertDialog(
                                            title: const Text('Delete Post'),
                                            content: const Text(
                                              'Are you sure you want to delete this post?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed:
                                                    () => Navigator.of(
                                                      context,
                                                    ).pop(false),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed:
                                                    () => Navigator.of(
                                                      context,
                                                    ).pop(true),
                                                child: const Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    );
                                    if (shouldDelete == true) {
                                      database.deletePost(postId);
                                    }
                                  },
                                ),
                              ),
                            Text(
                              message,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              email,
                              style: TextStyle(
                                fontSize: 13,
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.primary.withValues(),
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
