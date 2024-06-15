import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rename_capture/app/modules/image_list/views/image_list_view.dart';
import 'package:rename_capture/app/modules/settings/views/settings_view.dart';

class HomeController extends GetxController {
  int selectedIndex = 0;

  final List<Widget> screens = [
    ImageListView(),
    SettingsView(),
  ];

  void changeTabIndex(int index) {
    selectedIndex = index;
    update();
  }

  

}
