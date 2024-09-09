// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_super_parameters

import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/font_manager.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final String labelText;
  final String hintText;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged; // Add onChanged callback

  // ignore: prefer_const_constructors_in_immutables
  CustomDropdownMenu({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.dropdownItems,
    this.onChanged, // Accept onChanged callback
  }) : super(key: key);

  @override
  _CustomDropdownMenuState createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: ColorManager.secondary_color,
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                widget.labelText,
                style: getMediumStyle(
                  color: ColorManager.dark_grey,
                  fontSize: FontSize.s18,
                ),
              ),
            ],
          ),
        ),
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
    );
  }
}
