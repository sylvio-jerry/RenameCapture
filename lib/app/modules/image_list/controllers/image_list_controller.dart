import 'package:get/get.dart';
import 'package:rename_capture/app/models/image_model.dart';
import 'package:rename_capture/app/services/database_helper.dart';
import 'package:rename_capture/shared/constants/app_color.dart';

class ImageListController extends GetxController {
  var imageList = <ImageModel>[];
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadImages();
  }

  Future<void> loadImages() async {
    List<ImageModel> images = await dbHelper.getImages();
    imageList.assignAll(images);
    print("load data called");
    print('Images: $images');
    update();
  }

  Future<void> deleteAll() async {
    try {
      // Supprimer toutes les images et réinitialiser le dossier RenameCapture
      await dbHelper.deleteAllImages();

      // Afficher un message de succès
      Get.snackbar("Success", "Toutes les images et la base de données ont été supprimées avec succès",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.white,
          backgroundColor: AppColors.green);

      // Actualiser la liste des images
      loadImages();

    } catch (e) {
      Get.snackbar("Erreur",
          "Une erreur s'est produite lors de la suppression des images et de la base de données",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.white,
          backgroundColor: AppColors.red);
      print('Erreur: $e');
    }
  }
}
