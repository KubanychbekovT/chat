import 'package:json_annotation/json_annotation.dart';
import '../message/message_request.dart';

part 'group_request.g.dart';

@JsonSerializable()
class GroupRequest {
  final String adminNickname;
  final String createdTime;
  final int groupImageId;
  final String groupName;
  final int id;
  final List<MessageRequest> messages;
  final List<String> userNickNames;

  GroupRequest({
    required this.adminNickname,
    required this.createdTime,
    required this.groupImageId,
    required this.groupName,
    required this.id,
    required this.messages,
    required this.userNickNames,
  });

  factory GroupRequest.fromJson(Map<String, dynamic> json) =>
      _$GroupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GroupRequestToJson(this);
}
