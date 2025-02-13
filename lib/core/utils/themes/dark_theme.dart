import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_app/constants.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  secondaryHeaderColor: kBlueColor,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Color(0xff0A0C16),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xff0A0C16),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  indicatorColor: kBlueColor,
  iconTheme: const IconThemeData(color: kBlueColor),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // elevation: 12,
      backgroundColor: kBlueColor,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: kBlueColor,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xff0A0C16),
  useMaterial3: true,
);
