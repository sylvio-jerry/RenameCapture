import 'package:get/get.dart';

import '../controllers/formulaire_controller.dart';

class FormulaireBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormulaireController>(
      () => FormulaireController(),
    );
  }
}
