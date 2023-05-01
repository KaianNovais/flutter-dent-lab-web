
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget logo;
  final List<TextButton> navigationLinks;

  const CustomAppBar({super.key, required this.logo, required this.navigationLinks});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            logo,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: navigationLinks,
            ),
          ],
        ),
      ),
    );
  }
}