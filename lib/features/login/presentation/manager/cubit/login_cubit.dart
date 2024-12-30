import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/login/data/model/login_model.dart';
import 'package:task_app/features/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitialState());

  final LoginRepo _loginRepo;
  bool obscureText = true;

  // Controllers for the login form
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel? loginModel;

  Future<void> login() async {
    emit(LoginLoadingState());

    final response = await _loginRepo.login(
      emailController.text,
      passwordController.text,
    );
    response.fold((e) {
      log(e.toString());
      emit(LoginFialerState(e.message));
    }, (r) {
      loginModel = LoginModel.fromJson(r);
      emit(LoginSuccessState(loginModel!));
    });
  }

  void togglePassword() {
    obscureText = !obscureText;
    emit(LoginPasswordVisibilityState());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
