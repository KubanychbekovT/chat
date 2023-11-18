import 'package:bloc/bloc.dart';
import 'package:chat/repository/service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';


class SignUpCubit extends Cubit<SignUpState> {
  final AuthAPIService apiService;

  SignUpCubit(this.apiService) : super(const SignUpState.initial());

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(const SignUpState.loading());

    try {
      await apiService.registerUser(email, password);

      emit(const SignUpState.success());
    } catch (e) {
      emit(SignUpState.failure(e.toString()));
    }
  }
}
