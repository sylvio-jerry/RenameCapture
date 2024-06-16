import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rename_capture/app/models/image_model.dart';
import 'package:rename_capture/app/services/database_helper.dart';

class ImageListController extends GetxController {
  final DatabaseHelper dbHelper = DatabaseHelper();
  var imageList = <ImageModel>[];
  TextEditingController searchEditingController = TextEditingController();
  var isLoading = true;

  @override
  void onInit() {
    super.onInit();
    loadImages();
  }

  Future<void> loadImages() async {
    isLoading = true; // Définir isLoading à true avant de charger les images
    try {
      List<ImageModel> images = await dbHelper.getImages();
      imageList.assignAll(images);
    } catch (e) {
      print('Error loading images: $e');
    } finally {
      isLoading = false; // Mettre isLoading à false après le chargement
      update();
    }
  }

  void filterImages() async {
    await loadImages();
    final searchText = searchEditingController.text.toLowerCase();
    if (searchText.isEmpty) {
      // Si la requête est vide, afficher toutes les images
      return;
    } else {
      isLoading = true;
      // Filtrer les images en fonction du nom
      var filteredImages = imageList
          .where((image) => image.name.toLowerCase().contains(searchText))
          .toList();
      imageList.assignAll(filteredImages);
      isLoading = false;
      update();
    }
  }
}
