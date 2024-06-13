import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.textColor, this.bgColor, required this.label});

  final Color? textColor;
  final Color? bgColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      onPressed: () {},
      child: SizedBox(
        width: Get.width * .8,
        height: 50,
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
