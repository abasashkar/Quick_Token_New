import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/design/components/button.dart';
import 'package:quick_token_new/core/design/components/text_field.dart';
import 'package:quick_token_new/feature/auth/ui/components/q_role_tile.widget.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  LoginIntent selectedRole = LoginIntent.doctor; // ✅ FIXED

  @override
  Widget build(BuildContext context) {
    return QBasePage(
      labelWidget: const ExtraSmallText(text: 'Register', size: 20, color: Colors.white), // ✅ now updates correctly
      allowPopBack: true,
      enableScroll: true,
      addSafeSpace: true,
      children: [
        QTextField(controller: nameController, hintText: 'Name', keyboardType: TextInputType.name),
        const SizedBox(height: 18),
        QTextField(controller: nameController, hintText: 'Email', keyboardType: TextInputType.name),

        SizedBox(height: 18),
        ExtraSmallText(text: 'Select Role', size: 16, color: Colors.black),
        SizedBox(height: 10),

        Row(
          children: [
            QRoleTile(
              isSelected: selectedRole == LoginIntent.doctor,
              label: "Doctor",
              icon: Icons.local_hospital,
              onTap: () => setState(() => selectedRole = LoginIntent.doctor),
            ),
            const SizedBox(width: 12),
            QRoleTile(
              isSelected: selectedRole == LoginIntent.patient,
              label: "Patient",
              icon: Icons.person,
              onTap: () => setState(() => selectedRole = LoginIntent.patient),
            ),
          ],
        ),

        SizedBox(height: 20),

        /// REGISTER BUTTON
        QPrimaryButton(
          text: 'Register',
          onTap: () {
            final payload = {
              "name": nameController.text.trim(),
              "email": emailController.text.trim(),
              "role": selectedRole.name,
            };

            debugPrint('REGISTER PAYLOAD => $payload');
          },
        ),

        const SizedBox(height: 28),
      ],
    );
  }

  /// CLEAN FIELD WRAPPER

  /// MINIMAL ROLE TILE
}

/// ENUM
enum LoginIntent { patient, doctor, lab }

extension LoginIntentX on LoginIntent {
  String get value => name;
}
