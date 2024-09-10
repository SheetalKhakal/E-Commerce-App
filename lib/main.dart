// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/resources/theme_manager.dart';
import 'package:e_commerce_app/views/home_page.dart';
import 'package:e_commerce_app/views/login_page.dart';
import 'package:e_commerce_app/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: getApplicationTheme(),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashScreen(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
