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
        child: SizedBox(
          width: 600, // Set your desired width here
          child: Text(
            title,
            overflow: TextOverflow.ellipsis, // Prevents text overflow
            maxLines: 1, // Ensure text stays in one line
            style: Styles.textStyle16meduim.copyWith(color: Colors.white),
            textAlign: TextAlign.center, // Center the text
          ),
        ),
      ),
    );
  }
}
