import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_token_new/core/constants/app_spacing.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/design/components/button.dart';
import 'package:quick_token_new/core/design/components/snackbar.dart';
import 'package:quick_token_new/core/design/components/text_field.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_bloc.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_state.dart';
import 'package:quick_token_new/core/design/components/extra_small_text.dart';

class EmailLoginScreen extends StatefulWidget {
  final UserRole intent;
  const EmailLoginScreen({super.key, required this.intent});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  final TextEditingController emailController = TextEditingController();

  String get titleText {
    switch (widget.intent) {
      case UserRole.patient:
        return 'Patient Login';
      case UserRole.doctor:
        return 'Doctor Login';
      case UserRole.lab:
        return 'Laboratory Login';
    }
  }

  void _submitEmail() {
    final email = emailController.text.trim();

    if (email.isEmpty || !email.contains('@')) {
      QSnackBar.show(context, 'Please enter a valid email address');
      return;
    }

    context.read<AuthBloc>().add(RequestOtpEvent(email: email, intent: widget.intent));
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AppStatus.error) {
          QSnackBar.show(context, state.statusMessage.isEmpty ? 'Something went wrong' : state.statusMessage);
        }

        if (state.sendOTP && state.status == AppStatus.loaded) {
          if (state.email == null) return;

          context.push('/verifyOtp', extra: {'email': state.email, 'intent': widget.intent});
        }
      },
      child: QBasePage(
        labelWidget: Center(child: ExtraSmallText(text: titleText)),
        allowPopBack: true,
        enableScroll: true,
        addSafeSpace: true,
        children: [
          const SizedBox(height: AppSpacing.xl),

          Center(
            child: ExtraSmallText(
              text: 'Please enter your email address to continue!',
              style: QStyles.bodySmall,
              color: Qcolors.backgroundDark,
              maxLines: 2,
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          Container(
            decoration: BoxDecoration(
              color: Qcolors.backgroundLight,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [BoxShadow(color: Qcolors.shadowLight, blurRadius: 6, offset: Offset(0, 3))],
            ),
            child: QTextField(controller: emailController, hintText: 'Email', keyboardType: TextInputType.emailAddress),
          ),

          const SizedBox(height: AppSpacing.xl),

          QPrimaryButton(text: 'Next', onTap: _submitEmail, borderRadius: 12, height: 50),
        ],
      ),
    );
  }
}
