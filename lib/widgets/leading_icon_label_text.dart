// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/font_manager.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class LeadingIconLabelText extends StatelessWidget {
  final String labelText;
  final String hintText;

  // ignore: prefer_const_constructors_in_immutables
  LeadingIconLabelText({
    Key? key,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Aligns children to the start
      children: [
        Container(
          color: ColorManager.secondary_color, // Set the background color
          padding: EdgeInsets.all(5.0), // Add some padding
          child: Row(
            children: [
              Text(
                labelText, // Label Text from constructor
                style: getMediumStyle(
                  color: ColorManager.dark_grey, // Text color
                  fontSize: FontSize.s18, // Font size
                ),
              ),
            ],
          ),
        ),
        Container(
          color: ColorManager.white,
          padding: EdgeInsets.only(top: 5.0, left: 5.0),
          child: Row(
            children: [
              Icon(Icons.person, color: ColorManager.grey), // Leading icon
              SizedBox(width: 8.0), // Spacer between icon and text
              Text(
                hintText, // Replace with your dynamic text
                style: getRegularStyle(
                    color: ColorManager.black_text, fontSize: FontSize.s16),
              ),
            ],
          ),
        ),
        Divider(color: ColorManager.light_grey, thickness: 1.0),
      ],
    );
  }
}
