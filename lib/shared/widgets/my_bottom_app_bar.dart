import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rename_capture/app/modules/home/controllers/home_controller.dart';
import 'package:rename_capture/shared/constants/app_color.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => BottomAppBar(
        height: 75,
        notchMargin: 5.0,
        shape: const CircularNotchedRectangle(),
        color: AppColors.greyDark,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildBottomNavItem(
              index: 0,
              icon: Icons.list,
              title: 'Liste',
              active: controller.selectedIndex == 0,
              onTap: () => controller.changeTabIndex(0),
            ),
            buildBottomNavItem(
              index: 1,
              icon: Icons.settings,
              title: 'Paramètre',
              active: controller.selectedIndex == 1,
              onTap: () => controller.changeTabIndex(1),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavItem({
    required int index,
    required IconData icon,
    required String title,
    required bool active,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: active ? Colors.white : Colors.white.withOpacity(0.5),
            ),
            Text(
              title,
              style: Theme.of(Get.context!).textTheme.labelSmall!.copyWith(
                  color: active ? Colors.white : Colors.white.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }
}
