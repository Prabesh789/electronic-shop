import 'package:electronic_shop/presentaion/cart_screen/cart_screen.dart';
import 'package:electronic_shop/presentaion/product_screen/product_screen.dart';
import 'package:electronic_shop/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  static const List<Widget> _screens = <Widget>[
    ProductScreen(),
    CartScreen(),
  ];

  int _selectedIndex = 0;

  // _onTap function
  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
        switchInCurve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 700),
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: SizedBox(
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onTap,
            elevation: 10.0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.blueColor,
            iconSize: 27,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: AppColors.deepblueColor,
            unselectedItemColor: AppColors.whiteColor,
            unselectedLabelStyle:
                Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
            selectedLabelStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 12.8,
                  fontWeight: FontWeight.w800,
                ),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shop_2_outlined,
                ),
                label: 'Product',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: 'Cart',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
