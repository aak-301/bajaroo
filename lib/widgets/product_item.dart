import 'package:bajaroo/constants/routes.dart';
import 'package:bajaroo/constants/themes.dart';
import 'package:bajaroo/providers/cart.dart';
import 'package:bajaroo/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: AppColors.iconColor,
              ),
              onPressed: () {
                product.toggleFavStatus();
              },
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(
                productId: product.id,
                price: product.price,
                title: product.title,
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: AppColors.iconColor,
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(AppRoutes.productDetails, arguments: product.id),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
