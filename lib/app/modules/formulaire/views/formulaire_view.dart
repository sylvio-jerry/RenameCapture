import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:rename_capture/app/models/image_model.dart';
import 'package:rename_capture/shared/constants/app_color.dart';
import 'package:rename_capture/shared/widgets/custom_form_field.dart';
import 'package:rename_capture/shared/widgets/custom_outline_button.dart';
import 'package:rename_capture/shared/widgets/input_image_picker.dart';
import 'package:rename_capture/shared/widgets/modal_confirmation.dart';
import '../controllers/formulaire_controller.dart';

class FormulaireView extends GetView<FormulaireController> {
  const FormulaireView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImageModel? currentImage = Get.arguments;

    if (currentImage != null) {
      // Utiliser addPostFrameCallback pour différer la mise à jour de l'état
      SchedulerBinding.instance.addPostFrameCallback((_) {
        controller.imageNameController.text = currentImage.name;
        controller.imageBytes.value = File(currentImage.path).readAsBytesSync();
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.white,
              size: 30,
            )),
        title: Text(
          currentImage != null ? "Modifier la photo" : "Prendre une photo",
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
                onImageSelected: (imageBytes) {},
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    CustomOutlineButton(
                      label: currentImage != null ? "Modifier" : "Enregistrer",
                      borderColor: Theme.of(context).colorScheme.secondary,
                      textColor: Theme.of(context).colorScheme.secondary,
                      icon: currentImage != null
                          ? Icons.edit_note_sharp
                          : Icons.save,
                      onPressed: () {
                        if (currentImage != null) {
                          controller.updateImage(currentImage);
                        } else {
                          controller.saveImage();
                        }
                      },
                    ),
                    currentImage != null
                        ? Column(
                            children: [
                              SizedBox(height: 20),
                              CustomOutlineButton(
                                label: "Supprimer",
                                borderColor: AppColors.red,
                                textColor: AppColors.red,
                                icon: Icons.dangerous_outlined,
                                onPressed: () {
                                  showModalConfirmation(context,
                                      onTapCancel: () {
                                    Navigator.pop(context);
                                  }, onTapOk: () {
                                    controller.deleteImage(currentImage);
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                            ],
                          )
                        : SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
