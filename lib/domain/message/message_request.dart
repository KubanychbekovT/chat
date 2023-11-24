import 'package:json_annotation/json_annotation.dart';

part 'message_request.g.dart';

@JsonSerializable()
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

  factory MessageRequest.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MessageRequestToJson(this);
}
