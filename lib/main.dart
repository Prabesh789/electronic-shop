import 'package:electronic_shop/application/product_provider.dart';
import 'package:electronic_shop/presentaion/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:electronic_shop/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteColor,
          ),
          headline3: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
          bodyText1: TextStyle(
            fontSize: 20,
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
          subtitle1: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
          ),
        ),
      ),
      home: Scaffold(
        body: ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
          child: const BottomNavBar(),
        ),
      ),
    );
  }
}
