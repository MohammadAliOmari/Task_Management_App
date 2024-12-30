import 'package:flutter/material.dart';
import 'package:task_app/core/utils/styles/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style,
        onPressed: onPressed,
        child: Text(
          title,
          style: Styles.textStyle16meduim.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
