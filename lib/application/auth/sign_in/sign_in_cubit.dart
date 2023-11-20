import 'package:bloc/bloc.dart';
import 'package:chat/repository/auth/auth_reposotiry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState.initial());
  final authRepository=AuthRepository();
  Future<void> signIn(String email, String password) async {
    emit(const SignInState.loading());
      try {
       await  authRepository.signIn(email, password);
      emit(const SignInState.success());
    } catch (e) {
      emit(SignInState.error(errorMessage: 'Failed to sign in'));
      rethrow;
    }
  }
}

