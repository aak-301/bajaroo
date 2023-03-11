import 'package:bajaroo/constants/routes.dart';
import 'package:bajaroo/constants/themes.dart';
import 'package:bajaroo/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProdoductItem extends StatelessWidget {
  const UserProdoductItem({
    required this.id,
    required this.title,
    required this.imgUrl,
    super.key,
  });

  final String id;
  final String title;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.editProductsScreen, arguments: id);
              },
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Provider.of<Products>(context,listen: false).deleteProduct(id);
              },
              icon: const Icon(
                Icons.delete,
                color: AppColors.iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
