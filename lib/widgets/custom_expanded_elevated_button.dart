// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:e_commerce_app/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CustomExpandedButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final EdgeInsets padding;
  final VoidCallback onPressed;

  CustomExpandedButton({
    required this.icon,
    required this.label,
    required this.padding,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              padding: WidgetStateProperty.all<EdgeInsets>(padding),
            ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: AppSize.s48, color: ColorManager.dark_grey),
            Text(
              label,
              style:
                  getBoldStyle(color: ColorManager.black_text, fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
