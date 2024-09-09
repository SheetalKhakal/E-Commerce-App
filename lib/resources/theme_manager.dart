// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/font_manager.dart';
import 'package:e_commerce_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'styles_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors of the app
      dividerColor: ColorManager.light_grey,
      fontFamily: 'Roboto',
      primaryColor: ColorManager.primary_color,
      primaryColorLight: ColorManager.secondary_color,
      primaryColorDark: ColorManager.primary_color,
      disabledColor: ColorManager.grey,
      // ripple color
      splashColor: ColorManager.primary_color,
      // card view theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      // App bar theme
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        color: ColorManager.primary_color,
        shadowColor: ColorManager.grey,
        titleTextStyle:
            getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s22),
        iconTheme: IconThemeData(
          color: Colors.white, // Set the back arrow color to white globally
        ),
      ),
      // Button theme
      buttonTheme: ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ColorManager.grey,
          buttonColor: ColorManager.primary_color,
          splashColor: ColorManager.primary_color),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(AppPadding.p10),
          textStyle: getRegularStyle(color: ColorManager.white),
          backgroundColor: ColorManager.secondary_color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s15), // Circular border
          ),
        ),
      ),

      // Text theme
      textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManager.dark_grey, fontSize: FontSize.s18),
        displayMedium:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
        displaySmall: getBoldStyle(
            color: ColorManager.primary_color, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(
            color: ColorManager.primary_color, fontSize: FontSize.s14),
        titleLarge:
            getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        titleMedium: getMediumStyle(
            color: ColorManager.primary_color, fontSize: FontSize.s14),
        bodyMedium: getMediumStyle(
            color: ColorManager.black_text, fontSize: FontSize.s16),
        bodySmall: getRegularStyle(
            color: ColorManager.black_text, fontSize: FontSize.s14),
        bodyLarge: getRegularStyle(
            color: ColorManager.black_text, fontSize: FontSize.s18),
      ),

      // input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPadding.p2),

        hintStyle:
            getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s16),
        fillColor: ColorManager.grey.withOpacity(0.1),
        filled: false,
        labelStyle: getSemiBoldStyle(
            color: ColorManager.black_text, fontSize: FontSize.s16),
        errorStyle: getRegularStyle(color: ColorManager.red),

        // enabled border
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color:
                  ColorManager.grey), // Set the enabled underline color to grey
        ),

        // focused border
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: ColorManager.black_text,
              width: 2.0), // Set the focused underline color to black
        ),

        // error border
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.transparent, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused error border
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.transparent, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
      ),
      // Set the cursor color for the TextFormField widgets globally
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.black_text, // Set the cursor color to black
      ));
}
