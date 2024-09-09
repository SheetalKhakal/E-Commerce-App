// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/font_manager.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomLabelTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller; // Add controller field

  // ignore: prefer_const_constructors_in_immutables
  CustomLabelTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.controller, //  Mark controller as optional
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
        TextFormField(
          controller: controller ??
              TextEditingController(), // Use provided controller or create a new one
          decoration: InputDecoration(
            hintText: hintText, // Hint Text from constructor
            isDense: true, // Reduces the height
            // Apply the theme from the global inputDecorationTheme
            enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
            focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
            errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
            focusedErrorBorder:
                Theme.of(context).inputDecorationTheme.focusedErrorBorder,
            contentPadding:
                Theme.of(context).inputDecorationTheme.contentPadding,
            hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
            //  labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
            fillColor: Theme.of(context).inputDecorationTheme.fillColor,
            filled: Theme.of(context).inputDecorationTheme.filled,
          ),
        ),
      ],
    );
  }
}
