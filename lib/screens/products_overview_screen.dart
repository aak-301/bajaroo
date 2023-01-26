import 'package:bajaroo/providers/cart.dart';
import 'package:bajaroo/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductsOverViewScreen extends StatefulWidget {
  const ProductsOverViewScreen({super.key});

  @override
  State<ProductsOverViewScreen> createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  bool _showFavOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedVal) {
              if (selectedVal == FilterOptions.favorites) {
                setState(() {
                  _showFavOnly = true;
                });
              } else {
                setState(() {
                  _showFavOnly = false;
                });
              }
            },
            itemBuilder: ((_) {
              return [
                const PopupMenuItem(
                  value: FilterOptions.favorites,
                  child: Text('Only Favorites'),
                ),
                const PopupMenuItem(
                  value: FilterOptions.all,
                  child: Text('Show All'),
                ),
              ];
            }),
          ),
          Consumer<Cart>(
            builder: ((_, cartData, ch) => Badge(
                  value: cartData.itemCount.toString(),
                  child: ch!,
                )),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
          )
        ],
        title: const Text("Bazaroo"),
      ),
      body: ProductsGrid(toggleFavScreen: _showFavOnly),
    );
  }
}
