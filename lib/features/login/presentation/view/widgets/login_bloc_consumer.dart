import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/core/utils/app_router.dart';
import 'package:task_app/core/utils/styles/text_style.dart';
import 'package:task_app/core/widgets/custom_button.dart';
import 'package:task_app/core/widgets/custom_text_field.dart';
import 'package:task_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:task_app/core/widgets/custom_app_bar.dart';
import 'package:task_app/features/login/presentation/view/widgets/login_bloc_listener.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();

        return Form(
          key: cubit.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: 'Log In',
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/Ellipse.png'),
                  ],
                ),
                Text(
                  'Welcome Back',
                  style: Styles.textStyle25semibold
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 12.h,
                ),
                const Text(
                  'Please Inter your email address\nand password for Login',
                  style: TextStyle(
                    color: kGrayColor,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Email';
                    }
                  },
                  hintText: 'Enter Your Email',
                  controller: cubit.emailController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Password';
                    }
                  },
                  onpressed: cubit.togglePassword,
                  icon: cubit.obscureText
                      ? Icon(
                          Icons.visibility_off,
                          color: Theme.of(context).iconTheme.color,
                        )
                      : Icon(
                          Icons.visibility,
                          color: Theme.of(context).iconTheme.color,
                        ),
                  obscureText: cubit.obscureText,
                  hintText: 'Enter Your Password',
                  controller: cubit.passwordController,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomButton(
                  title: 'Log In',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.login();
                    }
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  children: [
                    const Center(
                      child: Text(
                        'Log in With',
                        style: TextStyle(color: kGrayColor),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.apple,
                            color: Theme.of(context).primaryColor,
                            size: 25.sp,
                          ),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                            size: 25.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not Registrar Yet?'),
                        TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero, minimumSize: Size.zero),
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.kSingup);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: kPurpleColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        );
      },
    );
  }
}
