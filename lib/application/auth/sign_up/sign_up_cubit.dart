import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat/repository/auth/auth_firebase_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.dart';

part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthFirebaseRepository authRepository;

  SignUpCubit(this.authRepository) : super(const SignUpState.initial());

  Future<void> register({
    required String email,
    required String name,
    required String password,
  }) async {
    emit(const SignUpState.loading());

    try {
      await authRepository.signUp(email, name, password);
      emit(const SignUpState.success());
    } catch (e) {
      emit(SignUpState.failure(e.toString()));
    }
  }
}


// class SignUpCubit extends Cubit<SignUpState> {
//   final AuthFirebaseRepository authRepository;
//
//   SignUpCubit(this.authRepository) : super(const SignUpState.initial());
//
//   FutureOr<bool?> register({
//     required String email,
//     required String password,
//   }) async {
//     emit(const SignUpState.loading());
//
//     try {
//       await authRepository.signUp(email, password);
//       emit(const SignUpState.success());
//     } catch (e) {
//       emit(SignUpState.failure(e.toString()));
//     }
//   }
// }
