import 'package:electronic_shop/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          padding: EdgeInsets.only(top: mediaQuery.padding.top),
          child: Center(
            child: Text(
              'Your cart',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.redColor,
                AppColors.yellowColor,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyColor,
                blurRadius: 20.0,
                spreadRadius: 1.0,
              )
            ],
          ),
        ),
        preferredSize: Size(mediaQuery.size.width, kToolbarHeight),
      ),
    );
  }
}
