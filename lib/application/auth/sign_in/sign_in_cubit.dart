import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState.initial());

  Future<void> signIn(String email, String password) async {
    emit(const SignInState.loading());

    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(const SignInState.success());
    } catch (e) {
      emit(SignInState.error(errorMessage: 'Failed to sign in'));
    }
  }
}

