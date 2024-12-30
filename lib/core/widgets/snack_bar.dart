import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void snackBar(
    {required BuildContext context,
    required state,
    required ToastificationType type,
    required String message,
    required String title,
    required Color color,
    required Color backgroundColor,
    required Icon icon,
    required Duration autoCloseDuration,
    required Color textcolor}) {
  {
    toastification.show(
      context: context, // optional if you use ToastificationWrapper
      type: type,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 4),
      title: Text(title),
      description: RichText(text: TextSpan(text: message)),
      alignment: Alignment.bottomCenter,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      icon: icon,
      showIcon: true, // show or hide the icon
      primaryColor: color,
      backgroundColor: backgroundColor,
      foregroundColor: textcolor,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
    );
  }
}
