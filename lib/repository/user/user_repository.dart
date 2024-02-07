import 'package:chat/domain/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_messaging/firebase_messaging.dart';

class UserRepository {
  final _firestore = FirebaseFirestore.instance;
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<User> getUser(String uid) async {
    final snapshot = await _firestore.collection('users').doc(uid).get();
    final user = User.fromFirestore(snapshot);

    return user;
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String name,
    String? avatarPath,
  }) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String retrievedName = name;

      String? fcmToken = await _firebaseMessaging.getToken();
      String? avatarUrl;
      if (avatarPath != null) {
        avatarUrl = await uploadAvatar(userCredential.user!.uid, avatarPath);
      }

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'fcmToken': fcmToken,
        'name': retrievedName,
        'uid': userCredential.user!.uid,
        'avatarUrl': avatarUrl,
      });
    } catch (e) {
      print('Registration failed: $e');
      rethrow;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static String get currentUserId => FirebaseAuth.instance.currentUser!.uid;
}

Future<String?> uploadAvatar(String userId, String imagePath) async {
  // Implement your image upload logic here (e.g., using Firebase Storage)
  // Return the uploaded image URL
  // Example using Firebase Storage:
  // StorageReference storageReference = FirebaseStorage.instance.ref().child('avatars/$userId.jpg');
  // UploadTask uploadTask = storageReference.putFile(File(imagePath));
  // await uploadTask.whenComplete(() => print('Avatar uploaded'));
  // return storageReference.getDownloadURL();
  return null; // Return null if no avatar upload logic is implemented
}

