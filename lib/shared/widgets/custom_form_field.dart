import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rename_capture/shared/constants/app_color.dart';
import 'package:rename_capture/shared/constants/font_size.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.label,
    required this.hintText,
    this.inputFormatters,
    this.validator,
    this.onChange,
    this.controller,
    this.iconData,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final IconData? iconData;
  final String hintText;
  final String label;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
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
        TextFormField(
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.greyDark.withOpacity(.8)),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          onChanged: onChange,
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(
                color: Theme.of(context).hintColor, fontSize: AppFontSize.MD),
            contentPadding:
                EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
            prefixIconColor: AppColors.greyDark.withOpacity(.5),
            prefixIcon: iconData != null
                ? Icon(
                    iconData,
                    color: AppColors.greyDark.withOpacity(.5),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
          ),
        ),
      ],
    );
  }
}
