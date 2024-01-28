part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = _Loading;

  const factory ProfileState.loaded({required User user}) = _Loaded;

  const factory ProfileState.failed() = _Failed;

  const factory ProfileState.logout() = _Logout;
}
