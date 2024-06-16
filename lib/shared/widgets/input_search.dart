import 'package:flutter/material.dart';
import 'package:rename_capture/shared/constants/app_color.dart';
import 'package:rename_capture/shared/constants/font_size.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({super.key, this.searchEditingController, this.onChange});
  final TextEditingController? searchEditingController;
  final void Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      // height: 55,
      child: TextField(
        controller: searchEditingController,
        onChanged: onChange,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.greyDark.withOpacity(.8)),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
          prefixIconColor: AppColors.greyDark.withOpacity(.5),
          hintText: "Rechercher ...",
          hintStyle: TextStyle(
              color: Theme.of(context).hintColor, fontSize: AppFontSize.MD),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
