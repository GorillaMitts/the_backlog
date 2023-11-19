import 'package:flutter/material.dart';
import '../components/custom_appbar_title.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.subtitle});
  final String subtitle;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: CustomAppbarTitle(
        subtitle: subtitle,
      ),
    );
  }
}
