import 'package:electronic_shop/core/custom_apbar.dart';
import 'package:electronic_shop/core/custom_product_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          mediaQuery: mediaQuery,
          onPressed: () {},
          title: 'Cart',
        ),
        preferredSize: Size(mediaQuery.size.width, kToolbarHeight),
      ),
      body: CustomProductCard(
        imgUrl: '',
        productName: '',
        productCategory: '',
        productPrice: '',
        productStock: '',
        buttonText: '',
        onPressed: () {},
      ),
    );
  }
}
