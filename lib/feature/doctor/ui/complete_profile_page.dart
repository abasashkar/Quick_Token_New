import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/feature/doctor/widgets/doctor_input_tile.dart';
import 'package:quick_token_new/feature/doctor/widgets/save_profile_button.dart';
import '../widgets/doctor_profile_avatar.dart';

class DoctorCompleteProfilePage extends StatelessWidget {
  const DoctorCompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return QBasePage(
      label: 'Complete Your Profile',
      addSafeSpace: true,
      enableScroll: true,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(height: 24),

        DoctorProfileAvatar(),

        SizedBox(height: 32),

        ProfileInputTile(icon: Icons.medical_services_outlined, label: 'Specialization'),

        SizedBox(height: 16),

        ProfileInputTile(icon: Icons.location_on_outlined, label: 'Location', iconColor: Colors.red),

        SizedBox(height: 40),

        SaveProfileButton(),

        SizedBox(height: 24),
      ],
    );
  }
}
