// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300.0,
              height: 300.0,
              child: Image(
                image: AssetImage('assets/images/images.png'),
                fit: BoxFit
                    .cover, // This ensures the image covers the entire container.
              ),
            ),
            SizedBox(height: 20),
            Text(
              'E-COMMERCE APP',
              style: getBoldStyle(color: ColorManager.black_text, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
