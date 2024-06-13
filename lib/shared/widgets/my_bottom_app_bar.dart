import 'package:flutter/material.dart';
import 'package:rename_capture/shared/constants/app_color.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5.0,
      shape: CircularNotchedRectangle(),
      color: AppColors.greyDark,
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Column(
              children: [
                Icon(
                  Icons.list,
                  color: AppColors.white,
                  // size: 40,
                ),
                Text(
                  "Liste",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.white),
                )
              ],
            ),
          ),
          SizedBox(
            width: 100,
            child: Column(
              children: [
                Icon(
                  Icons.settings,
                  color: AppColors.white.withOpacity(.5),
                  // size: 40,
                ),
                Text(
                  "Paramètre",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.white.withOpacity(.5)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
