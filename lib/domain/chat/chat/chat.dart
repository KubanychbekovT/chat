import 'package:chat/domain/chat/message/message.dart';
import 'package:chat/domain/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final List<String> participants;
  final User? withUser;
  final List<Message> messages;
  final DocumentReference reference;

  Chat({
    this.withUser,
    required this.messages,
    required this.participants,
    required this.reference,
  });

  factory Chat.fromFirestore(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return Chat(
      participants: List.from(data['participants']),
      messages:
          List.from(data['messages']).map((message) => Message.fromFirestore(message)).toList(),
      reference: document.reference,
    );
  }

  Chat copyWith({
    User? withUser,
    List<Message>? messages,
    List<String>? participants,
  }) {
    return Chat(
      withUser: withUser ?? this.withUser,
      messages: messages ?? this.messages,
      participants: participants ?? this.participants,
      reference: reference,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Chat &&
          runtimeType == other.runtimeType &&
          participants == other.participants &&
          withUser == other.withUser &&
          messages == other.messages &&
          reference == other.reference;

  @override
  int get hashCode =>
      participants.hashCode ^ withUser.hashCode ^ messages.hashCode ^ reference.hashCode;
}


// 1) получить список юзеров через where
// 2) парсить юзеров
// 3) отобразить
// 4) общий серча