import 'package:flutter/material.dart';
import 'package:rename_capture/shared/constants/app_color.dart';
import 'package:rename_capture/shared/constants/font_size.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  dividerColor: AppColors.grey_2,
  fontFamily: 'Poppins',
  primaryColor: AppColors.primary,
  colorScheme: const ColorScheme.light().copyWith(
    background: AppColors.white,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    onBackground: AppColors.black,
    error: AppColors.red,
  ),
  scaffoldBackgroundColor: AppColors.white,
  hintColor: AppColors.grey_2,
  textTheme: const TextTheme(
    // for title
    displayLarge: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.thirtySix,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.thirtyTwo,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.twentyEight,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.fourXL,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.twoXL,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.XL,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.MD,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.MD,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.SM,
      fontWeight: FontWeight.w400,
    ),
    // for body
    bodyLarge: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.XL,
    ),
    bodyMedium: TextStyle(color: AppColors.black, fontSize: AppFontSize.MD),
    bodySmall: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.SM,
    ),
    //for button label, caption, text underlined
    labelLarge: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.MD,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.SM,
      fontWeight: FontWeight.w700,
    ),
    labelSmall: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.SM,
      fontWeight: FontWeight.w400,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.transparent,
  ),
);
