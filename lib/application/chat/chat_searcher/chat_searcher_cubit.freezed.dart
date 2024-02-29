// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_searcher_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatSearcherState {
  List<Chat> get searchedChats => throw _privateConstructorUsedError;
  List<User> get searchedUsers => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatSearcherStateCopyWith<ChatSearcherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSearcherStateCopyWith<$Res> {
  factory $ChatSearcherStateCopyWith(
          ChatSearcherState value, $Res Function(ChatSearcherState) then) =
      _$ChatSearcherStateCopyWithImpl<$Res, ChatSearcherState>;
  @useResult
  $Res call(
      {List<Chat> searchedChats, List<User> searchedUsers, bool isLoading});
}

/// @nodoc
class _$ChatSearcherStateCopyWithImpl<$Res, $Val extends ChatSearcherState>
    implements $ChatSearcherStateCopyWith<$Res> {
  _$ChatSearcherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchedChats = null,
    Object? searchedUsers = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      searchedChats: null == searchedChats
          ? _value.searchedChats
          : searchedChats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      searchedUsers: null == searchedUsers
          ? _value.searchedUsers
          : searchedUsers // ignore: cast_nullable_to_non_nullable
              as List<User>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatSearcherStateImplCopyWith<$Res>
    implements $ChatSearcherStateCopyWith<$Res> {
  factory _$$ChatSearcherStateImplCopyWith(_$ChatSearcherStateImpl value,
          $Res Function(_$ChatSearcherStateImpl) then) =
      __$$ChatSearcherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Chat> searchedChats, List<User> searchedUsers, bool isLoading});
}

/// @nodoc
class __$$ChatSearcherStateImplCopyWithImpl<$Res>
    extends _$ChatSearcherStateCopyWithImpl<$Res, _$ChatSearcherStateImpl>
    implements _$$ChatSearcherStateImplCopyWith<$Res> {
  __$$ChatSearcherStateImplCopyWithImpl(_$ChatSearcherStateImpl _value,
      $Res Function(_$ChatSearcherStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchedChats = null,
    Object? searchedUsers = null,
    Object? isLoading = null,
  }) {
    return _then(_$ChatSearcherStateImpl(
      searchedChats: null == searchedChats
          ? _value._searchedChats
          : searchedChats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      searchedUsers: null == searchedUsers
          ? _value._searchedUsers
          : searchedUsers // ignore: cast_nullable_to_non_nullable
              as List<User>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatSearcherStateImpl implements _ChatSearcherState {
  _$ChatSearcherStateImpl(
      {required final List<Chat> searchedChats,
      required final List<User> searchedUsers,
      required this.isLoading})
      : _searchedChats = searchedChats,
        _searchedUsers = searchedUsers;

  final List<Chat> _searchedChats;
  @override
  List<Chat> get searchedChats {
    if (_searchedChats is EqualUnmodifiableListView) return _searchedChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedChats);
  }

  final List<User> _searchedUsers;
  @override
  List<User> get searchedUsers {
    if (_searchedUsers is EqualUnmodifiableListView) return _searchedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedUsers);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ChatSearcherState(searchedChats: $searchedChats, searchedUsers: $searchedUsers, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSearcherStateImpl &&
            const DeepCollectionEquality()
                .equals(other._searchedChats, _searchedChats) &&
            const DeepCollectionEquality()
                .equals(other._searchedUsers, _searchedUsers) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_searchedChats),
      const DeepCollectionEquality().hash(_searchedUsers),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSearcherStateImplCopyWith<_$ChatSearcherStateImpl> get copyWith =>
      __$$ChatSearcherStateImplCopyWithImpl<_$ChatSearcherStateImpl>(
          this, _$identity);
}

abstract class _ChatSearcherState implements ChatSearcherState {
  factory _ChatSearcherState(
      {required final List<Chat> searchedChats,
      required final List<User> searchedUsers,
      required final bool isLoading}) = _$ChatSearcherStateImpl;

  @override
  List<Chat> get searchedChats;
  @override
  List<User> get searchedUsers;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$ChatSearcherStateImplCopyWith<_$ChatSearcherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
