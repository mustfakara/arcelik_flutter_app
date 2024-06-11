import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const DrawerListItem({
    required this.title,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        title: Text(title),
      ),
    );
  }
}
