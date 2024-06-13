import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rename_capture/app/modules/formulaire/controllers/formulaire_controller.dart';
import 'package:rename_capture/shared/constants/app_color.dart';

class InputImagePicker extends StatelessWidget {
  const InputImagePicker({
    super.key,
    required this.label,
    required this.onImageSelected,
  });

  final String label;
  final Function(Uint8List?) onImageSelected;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FormulaireController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () async {
            await controller.pickImage();
            if (controller.imageBytes.value != null) {
              onImageSelected(controller.imageBytes.value);
            }
          },
          child: Obx(() {
            return DottedBorder(
              color: AppColors.grey_2,
              borderType: BorderType.RRect,
              strokeWidth: 1.5,
              radius: const Radius.circular(16),
              dashPattern: const [5, 5],
              child: Container(
                height: 350,
                width: double.infinity,
                child: Stack(
                  children: [
                    if (controller.imageBytes.value != null)
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.memory(
                            controller.imageBytes.value!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    if (controller.imageBytes.value != null)
                      Positioned(
                        right: 20,
                        bottom: 20,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(.7),
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white.withOpacity(0.8),
                            size: 30,
                          ),
                        ),
                      ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (controller.imageBytes.value == null)
                            Icon(
                              Icons.camera_alt,
                              color: AppColors.greyDark,
                              size: 70,
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (controller.imageBytes.value == null)
                            Text(
                              "Cliquez ici pour prendre une photo",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(color: AppColors.grey_2),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
