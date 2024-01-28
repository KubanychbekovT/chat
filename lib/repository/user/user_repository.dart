import 'package:chat/domain/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

class UserRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<User> getUser(String uid) async {
    final snapshot = await _firestore.collection('users').doc(uid).get();
    final user = User.fromFirestore(snapshot);

    return user;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static String get currentUserId => FirebaseAuth.instance.currentUser!.uid;
}
