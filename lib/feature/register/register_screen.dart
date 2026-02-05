import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/design/components/button.dart';
import 'package:quick_token_new/core/design/components/text_field.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/core/design/components/qrole_tile.widget.dart';
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

  UserRole selectedRole = UserRole.doctor; // ✅ FIXED

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listenWhen: (prev, curr) => prev.status != curr.status || prev.success != curr.success,
      listener: (context, state) {
        if (state.status == AppStatus.loaded && state.success) {
          context.go(
            '/emailLogin',
            extra: selectedRole, // pass role safely
          );
        }
      },
      child: QBasePage(
        labelWidget: const ExtraSmallText(text: 'Register', size: 20, color: Colors.white),
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
          QTextField(controller: emailController, hintText: 'Email', keyboardType: TextInputType.emailAddress),
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
            text: 'Register',
            onTap: () {
              context.read<RegisterBloc>().add(
                OnRegister(
                  email: emailController.text.trim(),
                  name: nameController.text.trim(),
                  role: selectedRole.name, // ✅ CORRECT
                ),
              );
            },
          ),
          const SizedBox(height: 28),

          Row(
            children: [
              Center(
                child: const ExtraSmallText(text: 'Already have an account?', size: 16, color: Colors.black),
              ),
              const SizedBox(width: 4),
              Center(
                child: GestureDetector(
                  onTap: () => context.go('/emailLogin', extra: selectedRole),
                  child: Center(
                    child: const ExtraSmallText(text: 'Login', size: 16, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
