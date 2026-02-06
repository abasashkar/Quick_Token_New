import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/design/components/button.dart';
import 'package:quick_token_new/core/design/components/snackbar.dart';
import 'package:quick_token_new/core/design/components/text_field.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/core/design/components/role_tile.dart';
import 'package:quick_token_new/feature/register/bloc/register_bloc.dart';
import 'package:quick_token_new/core/design/components/extra_small_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  UserRole selectedRole = UserRole.doctor;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status != AppStatus.loaded && state.status != AppStatus.error) {
          return;
        }

        if (state.status == AppStatus.error) {
          QSnackBar.show(context, state.statusMessage.isNotEmpty ? state.statusMessage : 'Something went wrong');
          return;
        }

        if (state.emailExists) {
          QSnackBar.show(context, state.statusMessage);
          return;
        }

        if (state.success) {
          QSnackBar.show(context, 'Registration successful!');
          context.go('/emailLogin', extra: selectedRole);
          return;
        }
      },
      child: QBasePage(
        labelWidget: const ExtraSmallText(text: 'Register', size: 20, color: Qcolors.onPrimaryText),
        allowPopBack: true,
        enableScroll: true,
        addSafeSpace: true,
        children: [
          QTextField(
            controller: nameController,
            hintText: 'Name',
            keyboardType: TextInputType.name,
            prefixIcon: Icon(Icons.person),
          ),
          const SizedBox(height: 18),
          QTextField(
            controller: emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(Icons.email),
          ),
          const SizedBox(height: 18),
          const ExtraSmallText(text: 'Select Role', size: 16, color: Colors.black),
          const SizedBox(height: 10),
          Row(
            children: [
              QRoleTile(
                isSelected: selectedRole == UserRole.doctor,
                label: "Doctor",
                icon: Icons.local_hospital,
                onTap: () => setState(() => selectedRole = UserRole.doctor),
              ),
              const SizedBox(width: 12),
              QRoleTile(
                isSelected: selectedRole == UserRole.patient,
                label: "Patient",
                icon: Icons.person,
                onTap: () => setState(() => selectedRole = UserRole.patient),
              ),
            ],
          ),
          const SizedBox(height: 20),
          QPrimaryButton(
            borderRadius: 12,
            height: 50,
            text: 'Register',
            onTap: () {
              context.read<RegisterBloc>().add(
                OnRegister(
                  email: emailController.text.trim(),
                  name: nameController.text.trim(),
                  role: selectedRole.name,
                ),
              );
            },
          ),
          const SizedBox(height: 28),

          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ExtraSmallText(text: 'Already have an account?', size: 16, color: Colors.black),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => context.go('/emailLogin', extra: selectedRole),
                  child: const ExtraSmallText(text: 'Login', size: 16, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
