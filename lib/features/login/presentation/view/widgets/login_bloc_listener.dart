import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/core/utils/app_router.dart';
import 'package:task_app/core/widgets/snack_bar.dart';
import 'package:task_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:toastification/toastification.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoadingState ||
          current is LoginSuccessState ||
          current is LoginFialerState,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).indicatorColor,
              ),
            ),
          );
        } else if (state is LoginSuccessState) {
          GoRouter.of(context).pop();
          snackBar(
              context: context,
              state: state,
              type: ToastificationType.success,
              message: 'Welcome ${state.loginModel.user?.name}',
              title: state.loginModel.message!,
              color: Colors.green,
              backgroundColor: Colors.green,
              icon: const Icon(Icons.check),
              autoCloseDuration: const Duration(seconds: 2),
              textcolor: Colors.white);
          GoRouter.of(context).go(AppRouter.kHome);
        } else if (state is LoginFialerState) {
          GoRouter.of(context).pop();
          snackBar(
              context: context,
              state: state,
              type: ToastificationType.error,
              message: state.error,
              title: 'Login Failed',
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
