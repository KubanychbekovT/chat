import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Message {
  final String text;
  final String sender;
  final bool hasRead;
  final DateTime createdAt;

  Message({
    required this.text,
    required this.sender,
    required this.hasRead,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'sender': sender,
      'hasRead': hasRead,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory Message.fromFirestore(Map<String, dynamic> document) {
    final data = document;
    return Message(
      text: data['text'] as String,
      sender: data['sender'] as String,
      hasRead: data['hasRead'] as bool,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  factory Message.fromRemoteMessage(RemoteMessage remoteMessage) {
    return Message(
      text: remoteMessage.data['text'],
      sender: remoteMessage.data['sender'],
      createdAt: DateTime.now(),
      hasRead: false,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.text == text &&
        other.sender == sender &&
        other.hasRead == hasRead &&
        other.createdAt == createdAt;
  }
}
