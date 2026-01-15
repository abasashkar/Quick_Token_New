import 'package:flutter/material.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/routes/routes_helper.dart';
import 'package:quick_token_new/widgets/big_text.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class SideBarButton extends StatelessWidget {
  const SideBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF4F8BFF);

    return Drawer(
      backgroundColor: primaryBlue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: primaryBlue),
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: BigText(text: 'MedicXpert', size: 28),
          ),

          _drawerItem(
            text: 'Patient Login',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RoutesHelper.emailLogin, arguments: UserRole.patient);
            },
          ),

          _drawerItem(
            text: 'Doctor Login',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RoutesHelper.emailLogin, arguments: UserRole.doctor);
            },
          ),

          _drawerItem(
            text: 'Laboratory Login',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RoutesHelper.emailLogin, arguments: UserRole.lab);
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerItem({required String text, required VoidCallback onTap}) {
    return Column(
      children: [
        ListTile(
          title: ExtraSmallText(text: text, size: 20, color: Colors.white),
          onTap: onTap,
        ),
        const Divider(color: Colors.white54, height: 1),
      ],
    );
  }
}
