import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rename_capture/app/modules/image_list/controllers/image_list_controller.dart';
import 'package:rename_capture/app/services/database_helper.dart';
import 'package:rename_capture/shared/constants/app_color.dart';

class SettingsController extends GetxController {
  int imageCount = 0;
  final imageListController = Get.find<ImageListController>();
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    getImageCount();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> deleteAll() async {
    try {
      // Supprimer toutes les images et réinitialiser le dossier RenameCapture
      await dbHelper.deleteAllImages();

      // Afficher un message de succès
      Get.snackbar("Success",
          "Toutes les images ont été supprimées avec succès",
          snackPosition: SnackPosition.TOP,
          colorText: AppColors.white,
          backgroundColor: AppColors.green,
          duration: const Duration(seconds: 2));
      getImageCount();
      imageListController.loadImages();
    } catch (e) {
      Get.snackbar("Erreur",
          "Une erreur s'est produite lors de la suppression des images",
          snackPosition: SnackPosition.TOP,
          colorText: AppColors.white,
          backgroundColor: AppColors.red,
          duration: const Duration(seconds: 2));
      print('Erreur: $e');
      update();
    }
  }

  Future<void> getImageCount() async {
    int count = await dbHelper.getImageCount();
    imageCount = count;
    update();
  }
}
