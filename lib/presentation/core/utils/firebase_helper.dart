import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseHelper {
  static final chatCollection = FirebaseFirestore.instance.collection('chats');
  static final userCollection = FirebaseFirestore.instance.collection('users');
  static User get currentUser=>FirebaseAuth.instance.currentUser!;
}
