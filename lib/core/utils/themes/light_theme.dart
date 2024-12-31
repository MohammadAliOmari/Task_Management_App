import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_app/constants.dart';

ThemeData lightTheme = ThemeData(
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: Colors.white,
    ),
    brightness: Brightness.light,
    primaryColor: kDarkBlueColor,
    scaffoldBackgroundColor: Colors.white,
    secondaryHeaderColor: kGrayColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: const IconThemeData(color: kPurpleColor),
    indicatorColor: kPurpleColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 12,
            backgroundColor: kPurpleColor,
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            shadowColor: kPurpleColor)),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white));
