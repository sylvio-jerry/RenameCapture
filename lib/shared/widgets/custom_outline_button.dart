import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    this.textColor,
    required this.borderColor,
    required this.label,
    required this.onPressed, // Ajouter onPressed
  }) : super(key: key);

  final Color? textColor;
  final Color borderColor;
  final String label;
  final VoidCallback onPressed; // Ajouter onPressed

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 55,
      child: TextButton(
        onPressed: onPressed, // Utiliser onPressed
        style: TextButton.styleFrom(
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: textColor,
                  ),
            ),
            const SizedBox(width: 15),
            Icon(
              Icons.save,
              color: textColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
