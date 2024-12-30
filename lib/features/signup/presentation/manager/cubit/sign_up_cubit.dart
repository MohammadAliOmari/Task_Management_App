import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/signup/data/model/sign_up_model.dart';
import 'package:task_app/features/signup/data/repo/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpRepo) : super(SignUpInitialState());
  bool obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignUpRepo _signUpRepo;
  SignUpModel? signUpModel;
  Future<void> signUp() async {
    emit(SignUpLoadingState());
    final response = await _signUpRepo.signUp(
      emailController.text,
      passwordController.text,
      nameController.text,
    );
    response.fold((e) {
      emit(SignUpFialerState(e.message));
    }, (r) {
      signUpModel = SignUpModel.fromJson(r);
      // log(signUpModel!.name!);
      emit(SignUpSuccessState(signUpModel!));
    });
  }

  void togglePassword() {
    obscureText = !obscureText;
    emit(SignUpPasswordVisibilityState(obscureText));
  }
}
