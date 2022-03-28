import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronic_shop/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    Key? key,
    required this.imgUrl,
    required this.productName,
    required this.productCategory,
    required this.productPrice,
    required this.productStock,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final String imgUrl;
  final String productName;
  final String productCategory;
  final String productPrice;
  final String productStock;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: AppColors.whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
            ),
          ),
          const Spacer(),
          Text(
            productName,
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Category: ',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                productCategory,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Price: ',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                productPrice,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Stocks: ',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                productStock,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          const SizedBox(height: 7),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Add to cart'),
          )
        ],
      ),
    );
  }
}
