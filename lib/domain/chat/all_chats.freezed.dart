// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_chats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileDataResponse _$FileDataResponseFromJson(Map<String, dynamic> json) {
  return _FileDataResponse.fromJson(json);
}

/// @nodoc
mixin _$FileDataResponse {
  String get fileData => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileDataResponseCopyWith<FileDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileDataResponseCopyWith<$Res> {
  factory $FileDataResponseCopyWith(
          FileDataResponse value, $Res Function(FileDataResponse) then) =
      _$FileDataResponseCopyWithImpl<$Res, FileDataResponse>;
  @useResult
  $Res call({String fileData, int id, String name, String path, String type});
}

/// @nodoc
class _$FileDataResponseCopyWithImpl<$Res, $Val extends FileDataResponse>
    implements $FileDataResponseCopyWith<$Res> {
  _$FileDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileData = null,
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      fileData: null == fileData
          ? _value.fileData
          : fileData // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileDataResponseImplCopyWith<$Res>
    implements $FileDataResponseCopyWith<$Res> {
  factory _$$FileDataResponseImplCopyWith(_$FileDataResponseImpl value,
          $Res Function(_$FileDataResponseImpl) then) =
      __$$FileDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fileData, int id, String name, String path, String type});
}

/// @nodoc
class __$$FileDataResponseImplCopyWithImpl<$Res>
    extends _$FileDataResponseCopyWithImpl<$Res, _$FileDataResponseImpl>
    implements _$$FileDataResponseImplCopyWith<$Res> {
  __$$FileDataResponseImplCopyWithImpl(_$FileDataResponseImpl _value,
      $Res Function(_$FileDataResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileData = null,
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? type = null,
  }) {
    return _then(_$FileDataResponseImpl(
      fileData: null == fileData
          ? _value.fileData
          : fileData // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileDataResponseImpl implements _FileDataResponse {
  _$FileDataResponseImpl(
      {required this.fileData,
      required this.id,
      required this.name,
      required this.path,
      required this.type});

  factory _$FileDataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileDataResponseImplFromJson(json);

  @override
  final String fileData;
  @override
  final int id;
  @override
  final String name;
  @override
  final String path;
  @override
  final String type;

  @override
  String toString() {
    return 'FileDataResponse(fileData: $fileData, id: $id, name: $name, path: $path, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileDataResponseImpl &&
            (identical(other.fileData, fileData) ||
                other.fileData == fileData) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fileData, id, name, path, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileDataResponseImplCopyWith<_$FileDataResponseImpl> get copyWith =>
      __$$FileDataResponseImplCopyWithImpl<_$FileDataResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileDataResponseImplToJson(
      this,
    );
  }
}

abstract class _FileDataResponse implements FileDataResponse {
  factory _FileDataResponse(
      {required final String fileData,
      required final int id,
      required final String name,
      required final String path,
      required final String type}) = _$FileDataResponseImpl;

  factory _FileDataResponse.fromJson(Map<String, dynamic> json) =
      _$FileDataResponseImpl.fromJson;

  @override
  String get fileData;
  @override
  int get id;
  @override
  String get name;
  @override
  String get path;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$FileDataResponseImplCopyWith<_$FileDataResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) {
  return _MessageResponse.fromJson(json);
}

/// @nodoc
mixin _$MessageResponse {
  String get content => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  List<int> get fileDataIds => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  String get messageType => throw _privateConstructorUsedError;
  String get recipient => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageResponseCopyWith<MessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageResponseCopyWith<$Res> {
  factory $MessageResponseCopyWith(
          MessageResponse value, $Res Function(MessageResponse) then) =
      _$MessageResponseCopyWithImpl<$Res, MessageResponse>;
  @useResult
  $Res call(
      {String content,
      String createdAt,
      List<int> fileDataIds,
      bool isRead,
      String messageType,
      String recipient,
      String sender});
}

/// @nodoc
class _$MessageResponseCopyWithImpl<$Res, $Val extends MessageResponse>
    implements $MessageResponseCopyWith<$Res> {
  _$MessageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? createdAt = null,
    Object? fileDataIds = null,
    Object? isRead = null,
    Object? messageType = null,
    Object? recipient = null,
    Object? sender = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      fileDataIds: null == fileDataIds
          ? _value.fileDataIds
          : fileDataIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageResponseImplCopyWith<$Res>
    implements $MessageResponseCopyWith<$Res> {
  factory _$$MessageResponseImplCopyWith(_$MessageResponseImpl value,
          $Res Function(_$MessageResponseImpl) then) =
      __$$MessageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String content,
      String createdAt,
      List<int> fileDataIds,
      bool isRead,
      String messageType,
      String recipient,
      String sender});
}

/// @nodoc
class __$$MessageResponseImplCopyWithImpl<$Res>
    extends _$MessageResponseCopyWithImpl<$Res, _$MessageResponseImpl>
    implements _$$MessageResponseImplCopyWith<$Res> {
  __$$MessageResponseImplCopyWithImpl(
      _$MessageResponseImpl _value, $Res Function(_$MessageResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? createdAt = null,
    Object? fileDataIds = null,
    Object? isRead = null,
    Object? messageType = null,
    Object? recipient = null,
    Object? sender = null,
  }) {
    return _then(_$MessageResponseImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      fileDataIds: null == fileDataIds
          ? _value._fileDataIds
          : fileDataIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageResponseImpl implements _MessageResponse {
  _$MessageResponseImpl(
      {required this.content,
      required this.createdAt,
      required final List<int> fileDataIds,
      required this.isRead,
      required this.messageType,
      required this.recipient,
      required this.sender})
      : _fileDataIds = fileDataIds;

  factory _$MessageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageResponseImplFromJson(json);

  @override
  final String content;
  @override
  final String createdAt;
  final List<int> _fileDataIds;
  @override
  List<int> get fileDataIds {
    if (_fileDataIds is EqualUnmodifiableListView) return _fileDataIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fileDataIds);
  }

  @override
  final bool isRead;
  @override
  final String messageType;
  @override
  final String recipient;
  @override
  final String sender;

  @override
  String toString() {
    return 'MessageResponse(content: $content, createdAt: $createdAt, fileDataIds: $fileDataIds, isRead: $isRead, messageType: $messageType, recipient: $recipient, sender: $sender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageResponseImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._fileDataIds, _fileDataIds) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.sender, sender) || other.sender == sender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      createdAt,
      const DeepCollectionEquality().hash(_fileDataIds),
      isRead,
      messageType,
      recipient,
      sender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageResponseImplCopyWith<_$MessageResponseImpl> get copyWith =>
      __$$MessageResponseImplCopyWithImpl<_$MessageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageResponseImplToJson(
      this,
    );
  }
}

abstract class _MessageResponse implements MessageResponse {
  factory _MessageResponse(
      {required final String content,
      required final String createdAt,
      required final List<int> fileDataIds,
      required final bool isRead,
      required final String messageType,
      required final String recipient,
      required final String sender}) = _$MessageResponseImpl;

  factory _MessageResponse.fromJson(Map<String, dynamic> json) =
      _$MessageResponseImpl.fromJson;

  @override
  String get content;
  @override
  String get createdAt;
  @override
  List<int> get fileDataIds;
  @override
  bool get isRead;
  @override
  String get messageType;
  @override
  String get recipient;
  @override
  String get sender;
  @override
  @JsonKey(ignore: true)
  _$$MessageResponseImplCopyWith<_$MessageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) {
  return _ChatResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatResponse {
  int get chatId => throw _privateConstructorUsedError;
  FileDataResponse get fileDataResponse => throw _privateConstructorUsedError;
  List<MessageResponse> get messageResponse =>
      throw _privateConstructorUsedError;
  String get partnerNickName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatResponseCopyWith<ChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatResponseCopyWith<$Res> {
  factory $ChatResponseCopyWith(
          ChatResponse value, $Res Function(ChatResponse) then) =
      _$ChatResponseCopyWithImpl<$Res, ChatResponse>;
  @useResult
  $Res call(
      {int chatId,
      FileDataResponse fileDataResponse,
      List<MessageResponse> messageResponse,
      String partnerNickName});

  $FileDataResponseCopyWith<$Res> get fileDataResponse;
}

/// @nodoc
class _$ChatResponseCopyWithImpl<$Res, $Val extends ChatResponse>
    implements $ChatResponseCopyWith<$Res> {
  _$ChatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? fileDataResponse = null,
    Object? messageResponse = null,
    Object? partnerNickName = null,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      fileDataResponse: null == fileDataResponse
          ? _value.fileDataResponse
          : fileDataResponse // ignore: cast_nullable_to_non_nullable
              as FileDataResponse,
      messageResponse: null == messageResponse
          ? _value.messageResponse
          : messageResponse // ignore: cast_nullable_to_non_nullable
              as List<MessageResponse>,
      partnerNickName: null == partnerNickName
          ? _value.partnerNickName
          : partnerNickName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FileDataResponseCopyWith<$Res> get fileDataResponse {
    return $FileDataResponseCopyWith<$Res>(_value.fileDataResponse, (value) {
      return _then(_value.copyWith(fileDataResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatResponseImplCopyWith<$Res>
    implements $ChatResponseCopyWith<$Res> {
  factory _$$ChatResponseImplCopyWith(
          _$ChatResponseImpl value, $Res Function(_$ChatResponseImpl) then) =
      __$$ChatResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int chatId,
      FileDataResponse fileDataResponse,
      List<MessageResponse> messageResponse,
      String partnerNickName});

  @override
  $FileDataResponseCopyWith<$Res> get fileDataResponse;
}

/// @nodoc
class __$$ChatResponseImplCopyWithImpl<$Res>
    extends _$ChatResponseCopyWithImpl<$Res, _$ChatResponseImpl>
    implements _$$ChatResponseImplCopyWith<$Res> {
  __$$ChatResponseImplCopyWithImpl(
      _$ChatResponseImpl _value, $Res Function(_$ChatResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? fileDataResponse = null,
    Object? messageResponse = null,
    Object? partnerNickName = null,
  }) {
    return _then(_$ChatResponseImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      fileDataResponse: null == fileDataResponse
          ? _value.fileDataResponse
          : fileDataResponse // ignore: cast_nullable_to_non_nullable
              as FileDataResponse,
      messageResponse: null == messageResponse
          ? _value._messageResponse
          : messageResponse // ignore: cast_nullable_to_non_nullable
              as List<MessageResponse>,
      partnerNickName: null == partnerNickName
          ? _value.partnerNickName
          : partnerNickName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatResponseImpl implements _ChatResponse {
  _$ChatResponseImpl(
      {required this.chatId,
      required this.fileDataResponse,
      required final List<MessageResponse> messageResponse,
      required this.partnerNickName})
      : _messageResponse = messageResponse;

  factory _$ChatResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatResponseImplFromJson(json);

  @override
  final int chatId;
  @override
  final FileDataResponse fileDataResponse;
  final List<MessageResponse> _messageResponse;
  @override
  List<MessageResponse> get messageResponse {
    if (_messageResponse is EqualUnmodifiableListView) return _messageResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messageResponse);
  }

  @override
  final String partnerNickName;

  @override
  String toString() {
    return 'ChatResponse(chatId: $chatId, fileDataResponse: $fileDataResponse, messageResponse: $messageResponse, partnerNickName: $partnerNickName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatResponseImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.fileDataResponse, fileDataResponse) ||
                other.fileDataResponse == fileDataResponse) &&
            const DeepCollectionEquality()
                .equals(other._messageResponse, _messageResponse) &&
            (identical(other.partnerNickName, partnerNickName) ||
                other.partnerNickName == partnerNickName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chatId, fileDataResponse,
      const DeepCollectionEquality().hash(_messageResponse), partnerNickName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatResponseImplCopyWith<_$ChatResponseImpl> get copyWith =>
      __$$ChatResponseImplCopyWithImpl<_$ChatResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatResponse implements ChatResponse {
  factory _ChatResponse(
      {required final int chatId,
      required final FileDataResponse fileDataResponse,
      required final List<MessageResponse> messageResponse,
      required final String partnerNickName}) = _$ChatResponseImpl;

  factory _ChatResponse.fromJson(Map<String, dynamic> json) =
      _$ChatResponseImpl.fromJson;

  @override
  int get chatId;
  @override
  FileDataResponse get fileDataResponse;
  @override
  List<MessageResponse> get messageResponse;
  @override
  String get partnerNickName;
  @override
  @JsonKey(ignore: true)
  _$$ChatResponseImplCopyWith<_$ChatResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
