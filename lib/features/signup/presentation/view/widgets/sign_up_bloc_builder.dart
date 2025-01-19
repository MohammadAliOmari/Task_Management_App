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
import 'package:task_app/core/widgets/custom_app_bar.dart';
import 'package:task_app/features/signup/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:task_app/features/signup/presentation/view/widgets/sign_up_bloc_listener.dart';

class SignUpBlocBuilder extends StatelessWidget {
  const SignUpBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: 'Sign Up',
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/Ellipse.png'),
                  ],
                ),
                Text(
                  'Create Account',
                  style: Styles.textStyle25semibold
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 12.h,
                ),
                const Text(
                  'Please Inter your Informatioin\nand create your account',
                  style: TextStyle(color: kGrayColor),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Name';
                    }
                  },
                  hintText: 'Enter Your Name',
                  controller: cubit.nameController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextField(
                  validator: (context) {
                    if (context!.isEmpty) {
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
                  height: 30.h,
                ),
                CustomButton(
                  title: 'Sign Up',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.signUp();
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
                        'Sign Up With',
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
                        const Text('Have an Account?'),
                        TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero, minimumSize: Size.zero),
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.kLogin);
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                                color: kPurpleColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SignUpBlocListener(),
              ],
            ),
          ),
        );
      },
    );
  }
}
