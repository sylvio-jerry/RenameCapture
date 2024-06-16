import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rename_capture/shared/widgets/image_tile.dart';
import 'package:rename_capture/shared/widgets/no_data.dart';

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
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 5),
              child: Column(
                children: [
                  InputSearch(
                    searchEditingController: controller.searchEditingController,
                    onChange: (query) => controller.filterImages(),
                  ),
                  Expanded(
                    child: Container(
                      child: state.imageList.isEmpty
                          ? NoData()
                          : GridView.builder(
                              padding: EdgeInsets.all(10.0),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1.0,
                                mainAxisExtent: 130.0,
                              ),
                              itemCount: state.imageList.length,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final image = state.imageList[index];
                                return ImageTile(image: image);
                              },
                            ),
                    ),
                  )
                ],
              ),
            );
          }
        });
  }
}
