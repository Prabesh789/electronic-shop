import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronic_shop/theme/theme_palatte.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          padding: EdgeInsets.only(top: mediaQuery.padding.top),
          child: Center(
            child: Text(
              'Electronic product',
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
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5 / 7,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: ThemePalate.whiteColor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    'https://electronic-ecommerce.herokuapp.com/fantechHeadset.jpg',
              ),
            ),
          );
        },
      ),
    );
  }
}
