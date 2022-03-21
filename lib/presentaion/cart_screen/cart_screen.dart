import 'package:electronic_shop/theme/theme_palatte.dart';
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
                ThemePalate.redColor,
                ThemePalate.yellowColor,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: ThemePalate.greyColor,
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
