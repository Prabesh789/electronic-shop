import 'package:electronic_shop/presentaion/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:electronic_shop/theme/theme_palatte.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 25,
            color: ThemePalate.blackColor,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: ThemePalate.blackColor,
          ),
          headline3: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: ThemePalate.whiteColor,
          ),
          bodyText1: TextStyle(
            fontSize: 20,
            color: ThemePalate.blackColor,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            fontSize: 18,
            color: ThemePalate.blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const BottomNavBar(),
    );
  }
}
