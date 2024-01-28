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
}
