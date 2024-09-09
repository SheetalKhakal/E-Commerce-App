// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MultilineTextClick extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final VoidCallback onTap;

  MultilineTextClick({
    required this.titleText,
    required this.subtitleText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Colors.black87),
          ),
          Text(
            subtitleText,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
