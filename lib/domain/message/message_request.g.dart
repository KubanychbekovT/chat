// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageRequest _$MessageRequestFromJson(Map<String, dynamic> json) =>
    MessageRequest(
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      fileDataIds:
          (json['fileDataIds'] as List<dynamic>).map((e) => e as int).toList(),
      isRead: json['isRead'] as bool,
      messageType: json['messageType'] as String,
      recipient: json['recipient'] as String,
      sender: json['sender'] as String,
    );

Map<String, dynamic> _$MessageRequestToJson(MessageRequest instance) =>
    <String, dynamic>{
      'content': instance.content,
      'createdAt': instance.createdAt,
      'fileDataIds': instance.fileDataIds,
      'isRead': instance.isRead,
      'messageType': instance.messageType,
      'recipient': instance.recipient,
      'sender': instance.sender,
    };
