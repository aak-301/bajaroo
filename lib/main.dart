import 'package:bajaroo/constants/routes.dart';
import 'package:bajaroo/providers/product.dart';
import 'package:bajaroo/screens/product_details_screen.dart';
import 'package:bajaroo/screens/products_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
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
        },
      ),
    );
  }
}
