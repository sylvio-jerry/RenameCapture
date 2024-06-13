import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:rename_capture/app/models/image_model.dart';
import 'package:rename_capture/app/services/database_helper.dart';
import 'dart:io';

class FormulaireController extends GetxController {
  var imageBytes = Rxn<Uint8List>();
  final DatabaseHelper dbHelper = DatabaseHelper();
  final imageNameController = TextEditingController();

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      imageBytes.value = await image.readAsBytes();
    }
  }

  Future<void> saveImage() async {
    if (imageBytes.value != null && imageNameController.text.isNotEmpty) {
      try {
        Directory appDir = await getApplicationDocumentsDirectory();
        String imagePath = join(appDir.path, '${imageNameController.text}.png');

        File imageFile = File(imagePath);
        await imageFile.writeAsBytes(imageBytes.value!);

        ImageModel newImage =
            ImageModel(name: imageNameController.text, path: imagePath);
        await dbHelper.insertImage(newImage);
        // Afficher un message de succès
        Get.snackbar("Success", "L'image a été enregistrée avec succès",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.green);
        resetForm();
      } catch (e) {
        Get.snackbar("Erreur",
            "Une erreur s'est produite lors de l'enregistrement de l'image",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red);
        resetForm();
        print('Erreur: $e');
      }
    } else {
      Get.snackbar("Erreur", "Veuillez prendre une image et entrer un nom",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.orange);
    }
  }

  void resetForm() {
    imageBytes.value = null;
    imageNameController.clear();
  }

  @override
  void onClose() {
    imageNameController.dispose();
    super.onClose();
  }
}
