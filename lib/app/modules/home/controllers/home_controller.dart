import 'package:get/get.dart';
import 'package:rename_capture/app/models/image_model.dart';
import 'package:rename_capture/app/services/database_helper.dart';

class HomeController extends GetxController {
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

  Future<void> addImage(String name, String path) async {
    ImageModel newImage = ImageModel(name: name, path: path);
    await dbHelper.insertImage(newImage);
  }
}
