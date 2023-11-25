import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_chats.freezed.dart';
part 'all_chats.g.dart';

@freezed
class FileDataResponse with _$FileDataResponse {
  factory FileDataResponse({
    required String fileData,
    required int id,
    required String name,
    required String path,
    required String type,
}) = _FileDataResponse;

  factory FileDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FileDataResponseFromJson(json);
}

@freezed
class MessageResponse with _$MessageResponse {
  factory MessageResponse({
    required String content,
    required String createdAt,
    required List<int> fileDataIds,
    required bool isRead,
    required String messageType,
    required String recipient,
    required String sender,
}) = _MessageResponse;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
}

@freezed
class ChatResponse with _$ChatResponse {
  factory ChatResponse({
    required int chatId,
    required FileDataResponse fileDataResponse,
    required List<MessageResponse> messageResponse,
    required String partnerNickName,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}

