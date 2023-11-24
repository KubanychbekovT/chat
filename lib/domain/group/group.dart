import 'package:json_annotation/json_annotation.dart';
import '../message/message_request.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  final String adminNickname;
  final String createdTime;
  final int groupImageId;
  final String groupName;
  final int id;
  final List<MessageRequest> messages;
  final List<String> userNickNames;

  Group({
    required this.adminNickname,
    required this.createdTime,
    required this.groupImageId,
    required this.groupName,
    required this.id,
    required this.messages,
    required this.userNickNames,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
