import 'package:chat/presentation/core/utils/firebase_helper.dart';
import 'package:chat/presentation/core/utils/toast_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthFirebaseRepository {

  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      final uid = FirebaseHelper.currentUser.uid;
      FirebaseHelper.userCollection.doc(uid).update({
        "fcmToken": await FirebaseMessaging.instance.getToken(),
      }).ignore();
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.message != null) ToastUtil.showErrorMessage(e.message!);
      }
      rethrow;
    }
  }

  Future<void> signUp(String email, String name, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = FirebaseHelper.currentUser;

      await FirebaseHelper.userCollection.doc(user.uid).set({
        "email": email,
        "fcmToken": await FirebaseMessaging.instance.getToken(),
      });
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.message != null) ToastUtil.showErrorMessage(e.message!);
      }
      rethrow;
    }
  }

}


// Future<void> signUp({required String email, required String password}) async {
//   try {
//     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   } on FirebaseAuthException catch(e) {
//     if (e.code == 'weak-password') {
//       throw Exception('This password is too weak');
//     } else if (e.code == 'email-already-in-use') {
//       throw Exception('The account already exists for that email');
//     }
//   } catch(e) {
//     throw Exception(e.toString());
//   }
// }