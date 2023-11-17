import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState.initial());


  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status:
      Formz.validate([state.name, email, state.password, state.rePassword]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status:
      Formz.validate([state.name, state.email, password, state.rePassword]),
    ));
  }

  void rePasswordChanged(String value) {
    final rePassword = RePassword.dirty(value);
    emit(state.copyWith(
      rePassword: rePassword,
      status:
      Formz.validate([state.name, state.email, state.password, rePassword]),
    ));
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(
      name: name,
      status:
      Formz.validate([name, state.email, state.password, state.rePassword]),
    ));
  }
