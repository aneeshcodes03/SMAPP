import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smapp/components/my_back_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // Current logged-in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // Fetch user details from Firestore
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    if (currentUser == null) {
      throw FirebaseAuthException(
        code: 'no-user',
        message: 'No user is currently logged in.',
      );
    }

    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: getUserDetails(),
      builder: (context, snapshot) {
        // 🔄 Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // ❌ Error handling
        if (snapshot.hasError) {
          String errorMessage = "Something went wrong.";

          final error = snapshot.error;
          if (error is FirebaseException && error.code == 'unavailable') {
            errorMessage =
                "Firestore is currently unavailable.\nPlease check your internet or try again later.";
          } else if (error is FirebaseAuthException &&
              error.code == 'no-user') {
            errorMessage = "No user is currently logged in.";
          }

          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ),
          );
        }

        // ⚪ No user data found
        if (!snapshot.hasData || snapshot.data!.data() == null) {
          return const Scaffold(
            body: Center(child: Text("No user data found")),
          );
        }

        // ✅ Success
        final userData = snapshot.data!.data()!;
        final username = userData['username'];

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [MyBackButton()],
                ),
                Text("Hey $username 👋"),
                const SizedBox(height: 20),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person, color: Colors.blue),
                            const SizedBox(width: 10),
                            const Text(
                              "Username: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(username),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(Icons.email, color: Colors.green),
                            const SizedBox(width: 10),
                            const Text(
                              "Email: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Flexible(child: Text(userData['email'])),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            // TODO: Implement edit username
                          },
                          child: const Text("Edit your username"),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            // TODO: Implement edit password
                          },
                          child: const Text("Edit your password"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
