import 'package:bajaroo/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Products productData = Provider.of<Products>(context);

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productData.items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: ((ctx, i) {
          return ProductItem(
            id: productData.items[i].id,
            title: productData.items[i].title,
            imageUrl: productData.items[i].imageUrl,
          );
        }));
  }
}
