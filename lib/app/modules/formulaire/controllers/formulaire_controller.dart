import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FormulaireController extends GetxController {
  
  
  var imageBytes = Rxn<Uint8List>();

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      imageBytes.value = await image.readAsBytes();
    }
  }
  
}
