import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_tasks/features/login/data/models/login_request_body.dart';
import 'package:users_tasks/features/login/data/repos/login_repo.dart';
part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final TextEditingController nameTextEditingController =
      TextEditingController();

  final TextEditingController jobTextEditingController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitLoginWithGoogleState() async {
    emit(const LoginState.loginWithGoogleLoading());

    final response = await _loginRepo.loginWithGoogle();
    response?.when(success: (loginWithGoogleResponse) {
      nameTextEditingController.text = loginWithGoogleResponse?.displayName ??
          loginWithGoogleResponse?.email ??
          '';
      jobTextEditingController.text =
          loginWithGoogleResponse?.email ?? 'Mobile Developer';
      emitLoginState();
      emit(const LoginState.loginWithGoogleSuccess());
    }, failure: (error) {
      emit(LoginState.loginWithGoogleError(
          error: error.apiErrorModel.title ?? " "));
    });
  }

  void emitLoginState() async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(
      LoginRequestBody(
          name: nameTextEditingController.text,
          job: jobTextEditingController.text),
    );
    response.when(success: (loginResponse) {
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.title ?? " "));
    });
  }
}
