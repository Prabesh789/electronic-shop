import 'package:electronic_shop/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.mediaQuery,
    required this.title,
    this.icon,
    required this.onPressed,
  }) : super(key: key);

  final MediaQueryData mediaQuery;
  final String title;
  final Widget? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: mediaQuery.padding.top),
      child: Center(
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              'Electronic product',
              style: Theme.of(context).textTheme.headline2,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.list),
            )
          ],
        ),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.blueColor,
            AppColors.redColor,
          ],
        ),
      ),
    );
  }
}
