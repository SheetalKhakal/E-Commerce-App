// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a Future.delayed to navigate to the home screen after a delay
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Center(
        child: Text(
          'E- COMMERCE APP',
          style: getBoldStyle(color: ColorManager.dark_grey, fontSize: 24),
        ),
      ),
    );
  }
}
