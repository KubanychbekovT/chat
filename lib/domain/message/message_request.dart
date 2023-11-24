class MessageRequest {
  final String content;
  final String createdAt;
  final List<String> fileDataIds;
  final bool isRead;
  final String messageType;
  final String recipient;
  final String sender;

  MessageRequest(
      {required this.content,
      required this.createdAt,
      required this.fileDataIds,
      required this.isRead,
      required this.messageType,
      required this.recipient,
      required this.sender});

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'createdAt': createdAt,
      'fileDataIds': fileDataIds,
      'isRead': isRead,
      'messageType': messageType,
      'recipient': recipient,
      'sender': sender,
    };

  }
}
