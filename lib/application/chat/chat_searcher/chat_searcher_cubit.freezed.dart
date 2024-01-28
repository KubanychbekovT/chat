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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatSearcherState {
  List<Chat> get searchedChats => throw _privateConstructorUsedError;

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
  $Res call({List<Chat> searchedChats});
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
  }) {
    return _then(_value.copyWith(
      searchedChats: null == searchedChats
          ? _value.searchedChats
          : searchedChats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
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
  $Res call({List<Chat> searchedChats});
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
  }) {
    return _then(_$ChatSearcherStateImpl(
      null == searchedChats
          ? _value._searchedChats
          : searchedChats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
    ));
  }
}

/// @nodoc

class _$ChatSearcherStateImpl implements _ChatSearcherState {
  _$ChatSearcherStateImpl(final List<Chat> searchedChats)
      : _searchedChats = searchedChats;

  final List<Chat> _searchedChats;
  @override
  List<Chat> get searchedChats {
    if (_searchedChats is EqualUnmodifiableListView) return _searchedChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedChats);
  }

  @override
  String toString() {
    return 'ChatSearcherState(searchedChats: $searchedChats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSearcherStateImpl &&
            const DeepCollectionEquality()
                .equals(other._searchedChats, _searchedChats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchedChats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSearcherStateImplCopyWith<_$ChatSearcherStateImpl> get copyWith =>
      __$$ChatSearcherStateImplCopyWithImpl<_$ChatSearcherStateImpl>(
          this, _$identity);
}

abstract class _ChatSearcherState implements ChatSearcherState {
  factory _ChatSearcherState(final List<Chat> searchedChats) =
      _$ChatSearcherStateImpl;

  @override
  List<Chat> get searchedChats;
  @override
  @JsonKey(ignore: true)
  _$$ChatSearcherStateImplCopyWith<_$ChatSearcherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
