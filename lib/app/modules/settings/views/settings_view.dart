import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rename_capture/app/modules/formulaire/controllers/formulaire_controller.dart';
import 'package:rename_capture/app/modules/image_list/controllers/image_list_controller.dart';
import 'package:rename_capture/shared/constants/app_color.dart';
import 'package:rename_capture/shared/widgets/custom_outline_button.dart';
import 'package:rename_capture/shared/widgets/custom_solide_button.dart';
import 'package:rename_capture/shared/widgets/modal_confirmation.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<SettingsController>(
            init: SettingsController(),
            initState: (state) {
              controller.getImageCount();
            },
            builder: (state) {
              return Container(
                width: Get.width,
                height: Get.height,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.1),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(
                        children: [
                          Container(
                              width: 150,
                              height: 150,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                color: AppColors.secondary.withOpacity(.1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    bottomLeft: Radius.circular(16.0)),
                              ),
                              child: Lottie.asset(
                                  'assets/animation/camera.json',
                                  width: 100)),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '+ ${controller.imageCount.toString()}',
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                Text(
                                  "Images",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * .2),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomSolideButton(
                              label: "Supprimer tous",
                              bgColor: AppColors.red,
                              textColor: AppColors.white,
                              onPressed: () {
                                showModalConfirmation(context, onTapCancel: () {
                                  Navigator.pop(context);
                                }, onTapOk: () {
                                  controller.deleteAll();
                                  Navigator.pop(context);
                                },
                                    title: "Suppression",
                                    content:
                                        "Toutes les images seront supprimées de votre appareil. Etes-vous sûr de vouloir continuer?");
                              },
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
