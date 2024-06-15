import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rename_capture/app/routes/app_pages.dart';
import 'package:rename_capture/shared/constants/app_color.dart';
import 'package:rename_capture/shared/widgets/custom_form_field.dart';
import 'package:rename_capture/shared/widgets/custom_outline_button.dart';
import 'package:rename_capture/shared/widgets/input_image_picker.dart';
import '../controllers/formulaire_controller.dart';

class FormulaireView extends GetView<FormulaireController> {
  const FormulaireView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
            onPressed: () => Get.toNamed(Routes.HOME),
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.white,
              size: 30,
            )),
        title: Text(
          'Prendre une photo',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.white),
        ),
        surfaceTintColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12.0),
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              SizedBox(height: 25),
              CustomFormField(
                label: "Nom",
                hintText: "nom de la photo",
                validator: (nom) {
                  if (nom == null || nom.isEmpty) {
                    return 'Le nom ne peut pas être vide';
                  }
                  return null;
                },
                controller: controller.imageNameController,
                iconData: Icons.person,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 50),
              InputImagePicker(
                label: "Photo",
                onImageSelected: (imageBytes) {
                  if (imageBytes != null) {
                    print('Image sélectionnée!');
                  } else {
                    print('Aucune image sélectionnée.');
                  }
                },
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomOutlineButton(
                  label: "Enregistrer",
                  borderColor: Theme.of(context).colorScheme.secondary,
                  textColor: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    controller.saveImage();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
