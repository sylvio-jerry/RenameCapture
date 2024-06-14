import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rename_capture/shared/constants/app_color.dart';

import '../controllers/image_list_controller.dart';
import 'package:rename_capture/shared/widgets/input_search.dart';

class ImageListView extends GetView<ImageListController> {
  ImageListView({Key? key}) : super(key: key);
  final controller = Get.put(ImageListController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageListController>(
        init: ImageListController(),
        initState: (state) {
          controller.loadImages();
        },
        builder: (state) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 5),
            child: Column(
              children: [
                InputSearch(),
                Expanded(
                  child: Container(
                    child: state.imageList.isEmpty
                        ? Center(
                            child: Text(
                              'Aucune image trouvée.',
                              style: TextStyle(
                                  color: AppColors.greyDark, fontSize: 16),
                            ),
                          )
                        : GridView.builder(
                            padding: EdgeInsets.all(10.0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                              mainAxisExtent: 200.0,
                            ),
                            itemCount: state.imageList.length,
                            itemBuilder: (context, index) {
                              final image = state.imageList[index];
                              return GridTile(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.file(
                                        File(image.path),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      image.name,
                                      style: TextStyle(
                                        color: AppColors.greyDark,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
