import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rename_capture/app/models/image_model.dart';
import 'package:rename_capture/app/routes/app_pages.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.image,
  });

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.FORMULAIRE, arguments: image);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.file(
              File(image.path),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child:
                Text(image.name, style: Theme.of(context).textTheme.labelSmall),
          ),
        ],
      ),
    );
  }
}
