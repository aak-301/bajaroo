import 'package:bajaroo/providers/products.dart';
import 'package:bajaroo/widgets/app_drawer.dart';
import 'package:bajaroo/widgets/user_product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: ((context, i) {
            return Column(
              children: [
                UserProdoductItem(
                  title: productData.items[i].title,
                  imgUrl: productData.items[i].imageUrl,
                ),
                const Divider(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
