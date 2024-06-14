import 'package:get/get.dart';

import '../controllers/image_list_controller.dart';

class ImageListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageListController>(
      () => ImageListController(),
    );
  }
}
