import 'package:electronic_shop/application/product_provider.dart';
import 'package:electronic_shop/core/custom_apbar.dart';
import 'package:electronic_shop/core/custom_product_card.dart';
import 'package:electronic_shop/infrastructure/product/repositories/product_repository.dart';
import 'package:electronic_shop/infrastructure/services/endpoints.dart';
import 'package:electronic_shop/presentaion/product_screen/widgets/hide_widget.dart';
import 'package:electronic_shop/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final productRepository = ProductRepository();
  var _scrollController = ScrollController();
  var _refreshController = RefreshController();
  @override
  void initState() {
    _fetchProducts();
    _scrollController = ScrollController();
    _refreshController = RefreshController();
    super.initState();
  }

  _fetchProducts() async {
    final productData = await productRepository.electronicProducts();
    if (productData.status == 'success') {
      if (productData.data.product.isNotEmpty) {
        context
            .read<ProductProvider>()
            .getProductList(productData.data.product);
        context.read<ProductProvider>().getUniqueCategoryList(
            productData.data.product[1].category.toSet().toList());
      }
    }
    context.read<ProductProvider>().setProductLoading(false);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    _refreshController.loadComplete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Consumer<ProductProvider>(
      builder: (_, provider, __) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            child: CustomAppBar(
              mediaQuery: mediaQuery,
              onPressed: () {},
              title: 'Electronic products',
            ),
            preferredSize: Size(mediaQuery.size.width, kToolbarHeight),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Stack(
              children: [
                SmartRefresher(
                  controller: _refreshController,
                  enablePullDown: true,
                  enablePullUp: false,
                  // ignore: prefer_const_constructors
                  header: ClassicHeader(),
                  onRefresh: () {
                    _fetchProducts();
                  },
                  child: (provider.productLoading)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : (provider.productListLength > 0)
                          ? GridView.builder(
                              controller: _scrollController,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 62,
                              ),
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: provider.productListLength,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 4 / 7,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                              itemBuilder: (context, index) {
                                final electronicProduct =
                                    provider.getProductByIndex(index);
                                const imgBaseUrl = Endpoints.imgBaseUrl;
                                return CustomProductCard(
                                  imgUrl:
                                      '$imgBaseUrl${electronicProduct.image}',
                                  productName: electronicProduct.name,
                                  productCategory:
                                      electronicProduct.category[1],
                                  productPrice: electronicProduct.price,
                                  productStock:
                                      electronicProduct.stock.toString(),
                                  buttonText: 'Add to cart',
                                  onPressed: () {},
                                );
                              },
                            )
                          : const Text('No any product'),
                ),
                ProductSearchBar(
                  scrollController: _scrollController,
                  widget: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: AppColors.whiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.deemBlueColor,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 25),
                          const Icon(Icons.search),
                          const Spacer(),
                          SizedBox(
                            width: mediaQuery.size.width / 1.7,
                            child: TextField(
                              cursorColor: AppColors.greyColor,
                              cursorHeight: 15,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    ?.copyWith(
                                      color: AppColors.greyColor,
                                    ),
                                contentPadding: const EdgeInsets.only(top: 5),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const SizedBox(width: 25),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
