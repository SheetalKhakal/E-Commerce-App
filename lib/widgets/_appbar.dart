// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

// Custom AppBar Widget with fixed title and color
class AssetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AssetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Assets Manager',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue.shade400,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); // kToolbarHeight = 56.0 in Flutter
}
