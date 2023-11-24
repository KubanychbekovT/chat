// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupRequest _$GroupRequestFromJson(Map<String, dynamic> json) => GroupRequest(
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

Map<String, dynamic> _$GroupRequestToJson(GroupRequest instance) =>
    <String, dynamic>{
      'adminNickname': instance.adminNickname,
      'createdTime': instance.createdTime,
      'groupImageId': instance.groupImageId,
      'groupName': instance.groupName,
      'id': instance.id,
      'messages': instance.messages,
      'userNickNames': instance.userNickNames,
    };
