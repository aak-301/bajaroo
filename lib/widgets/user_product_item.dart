
import 'package:bajaroo/constants/themes.dart';
import 'package:flutter/material.dart';

class UserProdoductItem extends StatelessWidget {
  const UserProdoductItem({
    required this.title,
    required this.imgUrl,
    super.key,
  });

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
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
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
