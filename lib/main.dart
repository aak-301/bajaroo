import 'package:bajaroo/constants/routes.dart';
import 'package:bajaroo/providers/cart.dart';
import 'package:bajaroo/providers/orders.dart';
import 'package:bajaroo/providers/products.dart';
import 'package:bajaroo/screens/cart_screen.dart';
import 'package:bajaroo/screens/edit_products_screen.dart';
import 'package:bajaroo/screens/order_screen.dart';
import 'package:bajaroo/screens/product_details_screen.dart';
import 'package:bajaroo/screens/products_overview_screen.dart';
import 'package:bajaroo/screens/user_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',
        ),
        home: const ProductsOverViewScreen(),
        routes: {
          AppRoutes.productDetails: (context) => const ProductDetailScreen(),
          AppRoutes.cartScreen: (context) => const CartScreen(),
          AppRoutes.orderScreen: (context) => const OrderScreen(),
          AppRoutes.userProductsScreen: (context) => const UserProductsScreen(),
          AppRoutes.editProductsScreen: (context) => const EditProductScreen(),
        },
      ),
    );
  }
}
