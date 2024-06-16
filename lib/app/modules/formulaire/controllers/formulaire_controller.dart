import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rename_capture/app/models/image_model.dart';
import 'package:rename_capture/app/modules/home/controllers/home_controller.dart';
import 'package:rename_capture/app/modules/home/views/home_view.dart';
import 'package:rename_capture/app/modules/image_list/controllers/image_list_controller.dart';
import 'package:rename_capture/app/modules/image_list/views/image_list_view.dart';
import 'package:rename_capture/app/routes/app_pages.dart';
import 'package:rename_capture/app/services/database_helper.dart';
import 'dart:io';

class FormulaireController extends GetxController {
  var imageBytes = Rxn<Uint8List>();
  final DatabaseHelper dbHelper = DatabaseHelper();
  final imageNameController = TextEditingController();
  final imageListController = Get.find<ImageListController>();
  final homeController = Get.find<HomeController>();

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      imageBytes.value = await image.readAsBytes();
    }
  }

  Future<void> saveImage() async {
    if (imageBytes.value != null && imageNameController.text.isNotEmpty) {
      try {
        String dirPath = await dbHelper.getRenameCapturePath();
        String imagePath = '$dirPath/${imageNameController.text}.png';

        File imageFile = File(imagePath);
        await imageFile.writeAsBytes(imageBytes.value!);

        ImageModel newImage =
            ImageModel(name: imageNameController.text, path: imagePath);
        await dbHelper.insertImage(newImage);

        // final result = await ImageGallerySaver.saveFile(imagePath);
        // if (result['isSuccess']) {
        //   print("Image added to gallery");
        // }

        // Afficher un message de succès
        Get.snackbar("Success", "L'image a été enregistrée avec succès",
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2));
        resetForm();
        imageListController.loadImages();
      } catch (e) {
        Get.snackbar("Erreur",
            "Une erreur s'est produite lors de l'enregistrement de l'image",
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2));
        resetForm();
        print('Erreur: $e');
      }
    } else {
      Get.snackbar("Erreur", "Veuillez prendre une image et entrer un nom",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.orange,
          duration: const Duration(seconds: 2));
    }
  }

  Future<void> updateImage(ImageModel currentImage) async {
    if (imageBytes.value != null && imageNameController.text.isNotEmpty) {
      try {
        String dirPath = await dbHelper.getRenameCapturePath();
        String imagePath = '$dirPath/${imageNameController.text}.png';

        File imageFile = File(imagePath);
        await imageFile.writeAsBytes(imageBytes.value!);

        ImageModel updatedImage = ImageModel(
            id: currentImage.id,
            name: imageNameController.text,
            path: imagePath);
        await dbHelper.updateImage(updatedImage);

        Get.snackbar("Success", "L'image a été mise à jour avec succès",
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2));
        resetForm();
        // Get.toNamed(Routes.HOME);
        Get.toNamed(Routes.HOME);
      } catch (e) {
        Get.snackbar("Erreur",
            "Une erreur s'est produite lors de la mise à jour de l'image",
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2));
        print('Erreur: $e');
      }
    } else {
      Get.snackbar("Erreur", "Veuillez prendre une image et entrer un nom",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.orange,
          duration: const Duration(seconds: 2));
    }
  }

  Future<void> deleteImage(ImageModel image) async {
    try {
      // Supprimer le fichier image du stockage
      final file = File(image.path);
      if (await file.exists()) {
        await file.delete();
      }

      // Supprimer l'image de la base de données
      await dbHelper.deleteImage(image.id);

      // Afficher un message de succès
      Get.snackbar("Success", "L'image a été supprimée avec succès",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2));

      // Réinitialiser le formulaire
      resetForm();

      Get.toNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("Erreur",
          "Une erreur s'est produite lors de la suppression de l'image",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2));
      print('Erreur: $e');
    }
  }

  void resetForm() {
    imageBytes.value = null;
    imageNameController.clear();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    resetForm();
    super.onClose();
  }
}
