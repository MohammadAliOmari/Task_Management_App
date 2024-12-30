import 'package:flutter/material.dart';
import 'package:task_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscureText = false,
      this.icon,
      this.onpressed,
      required this.validator});
  final String hintText;
  final Function(String?)? validator;
  final TextEditingController controller;
  final bool? obscureText;
  final Icon? icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).secondaryHeaderColor,
      obscureText: obscureText!,
      controller: controller,
      validator: (value) => validator!(value),
      decoration: InputDecoration(
        suffixIcon: obscureText != null
            ? (icon != null
                ? IconButton(
                    onPressed: onpressed,
                    icon: icon!,
                    color: kGrayColor,
                  )
                : null)
            : null,
        hintText: hintText,
        hintStyle: const TextStyle(color: kGrayColor),
        enabledBorder: buildInputOutlinedBorder(context),
        focusedBorder: buildInputOutlinedBorder(context),
        focusedErrorBorder: buildInputOutlinedBorder(context),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}

OutlineInputBorder buildInputOutlinedBorder(context) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide:
          BorderSide(color: Theme.of(context).iconTheme.color!, width: 1.3));
}
