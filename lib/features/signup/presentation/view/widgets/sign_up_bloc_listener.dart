import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/core/utils/app_router.dart';
import 'package:task_app/core/widgets/snack_bar.dart';
import 'package:task_app/features/signup/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:toastification/toastification.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpLoadingState ||
          current is SignUpSuccessState ||
          current is SignUpFialerState,
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: kPurpleColor,
              ),
            ),
          );
        } else if (state is SignUpSuccessState) {
          GoRouter.of(context).pop();
          snackBar(
              context: context,
              state: state,
              type: ToastificationType.success,
              message: 'Welcome ${state.signUpModel.user!.name!}',
              title: state.signUpModel.message!,
              color: Colors.green,
              backgroundColor: Colors.green,
              icon: const Icon(Icons.check),
              autoCloseDuration: const Duration(seconds: 2),
              textcolor: Colors.white);
          GoRouter.of(context).go(AppRouter.kLogin);
        } else if (state is SignUpFialerState) {
          GoRouter.of(context).pop();
          snackBar(
              context: context,
              state: state,
              type: ToastificationType.error,
              message: state.message,
              title: 'SignUp Failed',
              color: Colors.red,
              backgroundColor: Colors.red,
              icon: const Icon(Icons.error),
              autoCloseDuration: const Duration(seconds: 2),
              textcolor: Colors.white);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  // void setupErrorState(BuildContext context, String error) {
  //   GoRouter.of(context).pop();
  //   snackBar(context: context, state:, type: type, message: message, title: title, color: color, backgroundColor: backgroundColor, icon: icon, autoCloseDuration: autoCloseDuration, textcolor: textcolor)
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       icon: const Icon(
  //         Icons.error,
  //         color: Colors.red,
  //         size: 32,
  //       ),
  //       content: Text(
  //         error,
  //         style: Styles.textStyle16meduim,
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             context.pop();
  //           },
  //           child: Text(
  //             'Got it',
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
