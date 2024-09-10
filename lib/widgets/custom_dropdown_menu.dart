// ignore_for_file: prefer_const_constructors_in_immutables, use_super_parameters, library_private_types_in_public_api, prefer_const_constructors

import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/font_manager.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final String hintText;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final double width; // Add width parameter

  CustomDropdownMenu({
    Key? key,
    required this.hintText,
    required this.dropdownItems,
    this.onChanged,
    this.width = double.infinity, // Default width if not specified
  }) : super(key: key);

  @override
  _CustomDropdownMenuState createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        color: Colors.transparent, // Background color
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
        border: Border.all(
          color: ColorManager.dark_grey, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: getRegularStyle(
                  color: ColorManager.black_text,
                  fontSize: FontSize.s16,
                ),
              ),
              value: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(
                      newValue); // Call the callback with the new value
                }
              },
              items: widget.dropdownItems
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              style: getRegularStyle(
                color: ColorManager.black_text,
                fontSize: FontSize.s16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
