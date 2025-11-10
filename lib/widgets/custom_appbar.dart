import 'package:flutter/material.dart';
import 'package:get/get.dart'; // for Obx

import 'package:quick_token_new/controllers/theme_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget? icon;
  final bool showThemeToggle;
  final ThemeController themeController = Get.find(); // get your controller

  CustomAppBar({
    Key? key,
    required this.title,
    this.icon,
    this.showThemeToggle = false,
  }) : super(key: key);

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
      actions: [
        if (showThemeToggle) // 👈 only show if true
          Obx(
            () => IconButton(
              icon: Icon(
                themeController.isDarkMode.value
                    ? Icons.dark_mode
                    : Icons.light_mode,
                color: Colors.white,
              ),
              onPressed: () => themeController.toggleTheme(),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
