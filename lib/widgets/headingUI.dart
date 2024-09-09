// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:e_commerce_app/resources/values_manager.dart';
import 'package:flutter/material.dart';

class HeadingUI extends StatefulWidget {
  const HeadingUI({super.key});

  @override
  State<HeadingUI> createState() => _HeadingUIState();
}

class _HeadingUIState extends State<HeadingUI> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: AppPadding.p30),
        child: Column(
          children: [
            Text(
              "ASSET MANAGEMENT",
              textAlign: TextAlign.center,
              style: getBoldStyle(color: ColorManager.dark_grey, fontSize: 25),
            ),
            Text(
              "OPEN SOURCE ASSET MANAGEMENT",
              textAlign: TextAlign.start,
              style: getSemiBoldStyle(color: ColorManager.grey, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
