class FileDataResponse {
  final String fileData;
  final int id;
  final String name;
  final String path;
  final String type;

  FileDataResponse({
    required this.fileData,
    required this.id,
    required this.name,
    required this.path,
    required this.type,
  });

  factory FileDataResponse.fromJson(Map<String, dynamic> json) {
    return FileDataResponse(
      fileData: json['fileData'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      path: json['path'] as String,
      type: json['type'] as String,
    );
  }
}

class MessageRequest {
  final String content;
  final String createdAt;
  final List<int> fileDataIds;
  final bool isRead;
  final String messageType;
  final String recipient;
  final String sender;

  MessageRequest({
    required this.content,
    required this.createdAt,
    required this.fileDataIds,
    required this.isRead,
    required this.messageType,
    required this.recipient,
    required this.sender,
  });

  factory MessageRequest.fromJson(Map<String, dynamic> json) {
    return MessageRequest(
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      fileDataIds: (json['fileDataIds'] as List).map((id) => id as int).toList(),
      isRead: json['isRead'] as bool,
      messageType: json['messageType'] as String,
      recipient: json['recipient'] as String,
      sender: json['sender'] as String,
    );
  }
}

class ChatResponse {
  final int chatId;
  final FileDataResponse fileDataResponse;
  final List<MessageRequest> messageResponse;
  final String partnerNickName;

  ChatResponse({
    required this.chatId,
    required this.fileDataResponse,
    required this.messageResponse,
    required this.partnerNickName,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      chatId: json['chatId'] as int,
      fileDataResponse: FileDataResponse.fromJson(json['fileDataResponse']),
      messageResponse: (json['messageResponse'] as List)
          .map((msg) => MessageRequest.fromJson(msg))
          .toList(),
      partnerNickName: json['partnerNickName'] as String,
    );
  }
}
