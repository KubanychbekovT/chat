// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_chats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileDataResponseImpl _$$FileDataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FileDataResponseImpl(
      fileData: json['fileData'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      path: json['path'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$FileDataResponseImplToJson(
        _$FileDataResponseImpl instance) =>
    <String, dynamic>{
      'fileData': instance.fileData,
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'type': instance.type,
    };

_$MessageResponseImpl _$$MessageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageResponseImpl(
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      fileDataIds:
          (json['fileDataIds'] as List<dynamic>).map((e) => e as int).toList(),
      isRead: json['isRead'] as bool,
      messageType: json['messageType'] as String,
      recipient: json['recipient'] as String,
      sender: json['sender'] as String,
    );

Map<String, dynamic> _$$MessageResponseImplToJson(
        _$MessageResponseImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'createdAt': instance.createdAt,
      'fileDataIds': instance.fileDataIds,
      'isRead': instance.isRead,
      'messageType': instance.messageType,
      'recipient': instance.recipient,
      'sender': instance.sender,
    };

_$ChatResponseImpl _$$ChatResponseImplFromJson(Map<String, dynamic> json) =>
    _$ChatResponseImpl(
      chatId: json['chatId'] as int,
      fileDataResponse: FileDataResponse.fromJson(
          json['fileDataResponse'] as Map<String, dynamic>),
      messageResponse: (json['messageResponse'] as List<dynamic>)
          .map((e) => MessageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      partnerNickName: json['partnerNickName'] as String,
    );

Map<String, dynamic> _$$ChatResponseImplToJson(_$ChatResponseImpl instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'fileDataResponse': instance.fileDataResponse,
      'messageResponse': instance.messageResponse,
      'partnerNickName': instance.partnerNickName,
    };
