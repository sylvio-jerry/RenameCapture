import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rename_capture/app/modules/image_list/controllers/image_list_controller.dart';
import 'package:rename_capture/app/modules/image_list/views/image_list_view.dart';
import 'package:rename_capture/app/modules/settings/controllers/settings_controller.dart';
import 'package:rename_capture/app/modules/settings/views/settings_view.dart';

class HomeController extends GetxController {
  int selectedIndex = 0;

  final List<Widget> screens = [
    ImageListView(),
    SettingsView(),
  ];

  void changeTabIndex(int index) {
    selectedIndex = index;
    // Initialisez le contrôleur seulement si ce n'est pas déjà fait
    if (index == 0 && !Get.isRegistered<ImageListController>()) {
      Get.put(ImageListController());
    } else if (index == 1 && !Get.isRegistered<SettingsController>()) {
      Get.put(SettingsController());
    }
    update();
  }
}
