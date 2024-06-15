import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rename_capture/app/modules/home/bindings/home_binding.dart';
import 'package:rename_capture/shared/constants/app_constant.dart';
import 'package:rename_capture/themes/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'package:rename_capture/shared/tools/handle_permission.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestPermissions();
  runApp(
    GetMaterialApp(
      title: AppConstants.APP_NAME,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
    ),
  );
}

Future<void> requestPermissions() async {
  bool storagePermissionGranted =
      await HandlePermission.requestPermission(Permission.storage);
  if (!storagePermissionGranted) {
    // Handle the case where permission is not granted
    // You can show a dialog or close the app
    print("Storage permission not granted aaa.");
  }
}
