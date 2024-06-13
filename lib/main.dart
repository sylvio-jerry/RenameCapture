import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rename_capture/shared/constants/app_constant.dart';
import 'package:rename_capture/themes/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: AppConstants.APP_NAME,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
    ),
  );
}
