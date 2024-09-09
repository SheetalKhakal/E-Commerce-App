// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:e_commerce_app/resources/font_manager.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import '../resources/color.dart';

class AddressTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller; // Add controller field

  // ignore: prefer_const_constructors_in_immutables
  AddressTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.controller, //  Mark controller as optional
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddressTextFieldState createState() => _AddressTextFieldState();
}

class _AddressTextFieldState extends State<AddressTextField> {
  late String _hintText;
  void initState() {
    super.initState();
    // Initialize the hint text with the value passed in the constructor
    _hintText = widget.hintText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Aligns children to the start
      children: [
        Text(
          widget.labelText, // Label Text from constructor
          style: getMediumStyle(
            color: ColorManager.black_text, // Text color
            fontSize: FontSize.s18, // Font size
          ),
        ),
        TextField(
          controller:
              widget.controller, // Use provided controller or create a new one

          decoration: InputDecoration(
            hintText: _hintText, // Hint text that changes dynamically
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
            labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
            fillColor: Theme.of(context).inputDecorationTheme.fillColor,
            filled: Theme.of(context).inputDecorationTheme.filled,
          ),
          onChanged: (value) {
            // Change the hintText based on user input
            setState(() {
              _hintText = value.isEmpty ? widget.hintText : value;
            });
          },
        ),
      ],
    );
  }
}
