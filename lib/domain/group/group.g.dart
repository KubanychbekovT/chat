// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      adminNickname: json['adminNickname'] as String,
      createdTime: json['createdTime'] as String,
      groupImageId: json['groupImageId'] as int,
      groupName: json['groupName'] as String,
      id: json['id'] as int,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      userNickNames: (json['userNickNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'adminNickname': instance.adminNickname,
      'createdTime': instance.createdTime,
      'groupImageId': instance.groupImageId,
      'groupName': instance.groupName,
      'id': instance.id,
      'messages': instance.messages,
      'userNickNames': instance.userNickNames,
    };
