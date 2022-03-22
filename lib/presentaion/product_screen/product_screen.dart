import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronic_shop/application/product_provider.dart';
import 'package:electronic_shop/infrastructure/product/repositories/product_repository.dart';
import 'package:electronic_shop/infrastructure/services/endpoints.dart';
import 'package:electronic_shop/theme/theme_palatte.dart';
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
                  childAspectRatio: 5 / 7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  var electronicProduct = provider.getProductByIndex(index);
                  const imgBaseUrl = Endpoints.imgBaseUrl;
                  return Container(
                    color: ThemePalate.whiteColor,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: '$imgBaseUrl${electronicProduct.image}',
                      ),
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
}
