// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/views/home_page.dart';
import 'package:e_commerce_app/views/login_page.dart';
import 'package:e_commerce_app/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashScreen(),
        "/login": (context) => LoginScreen(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
