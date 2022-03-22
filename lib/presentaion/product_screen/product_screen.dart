import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronic_shop/application/product_provider.dart';
import 'package:electronic_shop/infrastructure/product/repositories/product_repository.dart';
import 'package:electronic_shop/infrastructure/services/endpoints.dart';
import 'package:electronic_shop/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final productRepository = ProductRepository();
  @override
  void initState() {
    _fetchProducts();
    super.initState();
  }

  _fetchProducts() async {
    final productData = await productRepository.electronicProducts();
    if (productData.status == 'success') {
      if (productData.data.product.isNotEmpty) {
        context
            .read<ProductProvider>()
            .getProductList(productData.data.product);
      }
    }
    context.read<ProductProvider>().setProductLoading(false);
  }

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
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.blueColor,
                AppColors.redColor,
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
      body: Consumer<ProductProvider>(
        builder: (_, provider, __) {
          if (provider.productLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (provider.productListLength > 0) {
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: provider.productListLength,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4.2 / 7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final electronicProduct = provider.getProductByIndex(index);
                  const imgBaseUrl = Endpoints.imgBaseUrl;
                  // List<Widget> _categories;
                  // _categories = electronicProduct.category
                  //     .map(
                  //       (names) => Container(
                  //         padding: const EdgeInsets.all(4.0),
                  //         color: Colors.white,
                  //         child: Text(
                  //           names,
                  //           textScaleFactor: 1.2,
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         width: double.infinity,
                  //         height: double.infinity,
                  //       ),
                  //     )
                  //     .toList();
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
                            imageUrl: '$imgBaseUrl${electronicProduct.image}',
                          ),
                        ),
                        const Spacer(),
                        Text(
                          electronicProduct.name,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(height: 5),
                        // SizedBox(
                        //   height: 14,
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.horizontal,
                        //     shrinkWrap: true,
                        //     itemCount: electronicProduct.category.length,
                        //     itemBuilder: (context, item) {
                        //       final productCategories =
                        //           electronicProduct.category[item];
                        //       return Wrap(
                        //         children: [
                        //           Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //               horizontal: 4,
                        //             ),
                        //             child: Text(productCategories),
                        //           ),
                        //         ],
                        //       );
                        //     },
                        //   ),
                        // ),
                        productDetails(
                          context: context,
                          title: 'Price: ',
                          productDetails: electronicProduct.price,
                        ),
                        productDetails(
                          context: context,
                          title: 'Stock: ',
                          productDetails: electronicProduct.stock.toString(),
                        ),
                        const SizedBox(height: 7),
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Add to cart'))
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Text('No any prtduct');
            }
          }
        },
      ),
    );
  }

  Widget productDetails({
    required BuildContext context,
    required String productDetails,
    required String title,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          productDetails,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
