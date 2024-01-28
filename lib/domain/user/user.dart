import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String uid;
  final DocumentReference reference;
  final String? fcmToken;

  User({
    required this.name,
    required this.uid,
    required this.reference,
    this.fcmToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      uid: json['uid'],
      reference: json['reference'],
      fcmToken: json['fcmToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uid': uid,
      'reference': reference,
      'fcmToken': fcmToken,
    };
  }

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return User(
      name: data['name'],
      uid: data['uid'],
      reference: document.reference,
      fcmToken: data['fcmToken'],
    );
  }
}
