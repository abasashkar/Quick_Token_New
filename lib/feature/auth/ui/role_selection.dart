import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class RoleSelection extends StatelessWidget {
  const RoleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return QBasePage(
      // drawer: const SideBarButton(),
      labelWidget: const ExtraSmallText(text: 'Role Selection', size: 20, color: Colors.white),
      customChild: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAppointmentButton(
                icon: const FaIcon(FontAwesomeIcons.stethoscope, color: Colors.white, size: 40),
                title: "Book Doctor Appointment",
                onTap: () {
                  context.push('/register', extra: {'intent': UserRole.patient});
                },
              ),
              const SizedBox(height: 20),
              _buildAppointmentButton(
                icon: const Icon(Icons.science, color: Colors.white, size: 40),
                title: "Book Laboratory Appointment",
                onTap: () {
                  context.push('/emailLogin', extra: {'intent': UserRole.lab});
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentButton({required Widget icon, required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 38),
        decoration: BoxDecoration(
          color: Qcolors.primary,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [BoxShadow(color: Qcolors.backgroundDark, blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
