import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
      {super.key,
      this.textColor,
      required this.borderColor,
      required this.label});

  final Color? textColor;
  final Color borderColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: Get.width,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: borderColor)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: textColor),
              ),
              const SizedBox(width: 15),
              Icon(
                Icons.save,
                color: textColor,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
