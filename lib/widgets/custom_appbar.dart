import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget? icon;
  final bool showThemeToggle;

  CustomAppBar({Key? key, required this.title, this.icon, this.showThemeToggle = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      centerTitle: true,
      backgroundColor: const Color(0xFF4F8BFF),
      title: title,
      leading: icon != null
          ? IconButton(
              icon: icon!,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            )
          : null,
      actions: [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
