import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/dependency_injection/dependency_injection.dart';

import 'package:task_app/features/signup/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:task_app/features/signup/presentation/view/widgets/sign_up_bloc_builder.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocProvider(
            create: (context) => getIt.get<SignUpCubit>(),
            child: const SignUpBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
