// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/resources/color.dart';
import 'package:flutter/material.dart';

// Custom AppBar Widget with changeable title

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback?
      onBackPressed; // Add a customizable onPressed function for the back button

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: ColorManager.primary_color,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onBackPressed ??
            () {
              Navigator.of(context)
                  .pop(); // Default behavior if onBackPressed is not provided
            },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
