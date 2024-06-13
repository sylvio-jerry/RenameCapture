import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rename_capture/app/routes/app_pages.dart';
import 'package:rename_capture/shared/constants/app_color.dart';
import 'package:lottie/lottie.dart';
import 'package:rename_capture/shared/widgets/input_search.dart';
import 'package:rename_capture/shared/widgets/my_bottom_app_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.FORMULAIRE),
        child: Icon(
          Icons.camera_alt,
          color: AppColors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        shape: OvalBorder(),
      ),
      appBar: myAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 5),
          child: InputSearch(),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: const Text(
        'RenameCapture',
        style: TextStyle(color: Colors.white),
      ),
      elevation: 0,
      leading: const Icon(Icons.cameraswitch, color: AppColors.white),
      actions: [
        IconButton(
          onPressed: () {
            helpModalBottomSheet(context);
          },
          icon: const Icon(Icons.live_help, color: Colors.white),
        )
      ],
      automaticallyImplyLeading: false,
    );
  }

  Future<dynamic> helpModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        showDragHandle: true,
        context: context,
        builder: (context) {
          return SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Aide",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          letterSpacing: 2),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      "Vous pouvez capturer des photos et attribuer le nom de la photo",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.grey_3, letterSpacing: 2),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Lottie.asset('assets/animation/camera.json'),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
