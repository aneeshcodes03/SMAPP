// database for storing SMAPP posts

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class FirestoreDatabase {
  // current user
  User? user = FirebaseAuth.instance.currentUser;

  // collect post from databse
  final CollectionReference posts = FirebaseFirestore.instance.collection(
    "Posts",
  );

  // post a message
  Future<DocumentReference<Object?>> addPost(String message) {
    return posts.add({
      'UserEmail': user!.email,
      'PostMessage': message,
      'TimeStamp': Timestamp.now(),
    });
  }

  // add post to database
  Stream<QuerySnapshot> getPostsStream() {
    final postsStream =
        FirebaseFirestore.instance
            .collection('Posts')
            .orderBy('TimeStamp', descending: true)
            .snapshots();
    return postsStream;
  }

  // display post to app from databse
}
