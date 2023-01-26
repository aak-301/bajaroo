import 'package:bajaroo/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    required this.toggleFavScreen,
    Key? key,
  }) : super(key: key);

  final bool toggleFavScreen;

  @override
  Widget build(BuildContext context) {
    Products productData = Provider.of<Products>(context);
    final products =
        toggleFavScreen ? productData.favoriteItems : productData.items;

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: ((ctx, i) {
          return ChangeNotifierProvider.value(
            value: products[i],
            child: const ProductItem(),
          );
        }));
  }
}
