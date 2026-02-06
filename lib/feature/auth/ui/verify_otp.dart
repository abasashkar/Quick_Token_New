import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_token_new/core/constants/app_spacing.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/design/components/button.dart';
import 'package:quick_token_new/core/design/components/extra_small_text.dart';
import 'package:quick_token_new/core/design/components/snackbar.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_bloc.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_state.dart';
import 'package:quick_token_new/feature/auth/ui/components/otpinput_field.dart';
import 'package:quick_token_new/feature/auth/ui/components/resend_otp_button.dart';

/// Route constants
class Routes {
  static const patientsHome = '/patientsHomeScreen';
  static const doctorHome = '/doctorHomeScreen';
  static const doctorCompleteProfile = '/doctorCompleteProfile';
}

class VerifyOtpScreen extends StatefulWidget {
  final String email;
  final UserRole intent;

  const VerifyOtpScreen({super.key, required this.email, required this.intent});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: _authListener,
      builder: (context, state) {
        return QBasePage(
          label: 'Verify OTP',
          enableScroll: true,
          children: [
            const SizedBox(height: AppSpacing.xl),

            /// Lock Icon
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Qcolors.secondary, shape: BoxShape.circle),
              child: const Icon(Icons.lock_outline_rounded, size: 36, color: Qcolors.primary),
            ),

            const SizedBox(height: AppSpacing.lg),

            /// Heading
            const ExtraSmallText(text: 'Enter Verification Code', style: QStyles.h2, color: Qcolors.primaryText),

            const SizedBox(height: AppSpacing.sm),

            /// Subtitle
            ExtraSmallText(
              text: 'We sent a 6-digit code to your email',
              style: QStyles.title,
              color: Qcolors.secondaryText,
            ),

            const SizedBox(height: 2),
            ExtraSmallText(text: widget.email, style: QStyles.label, color: Qcolors.primaryText),

            const SizedBox(height: AppSpacing.lg),

            /// OTP Input
            OtpInputField(controller: _otpController),

            const SizedBox(height: AppSpacing.lg),

            /// Verify OTP Button
            QPrimaryButton(
              text: 'Verify OTP',
              isLoading: state.status == AppStatus.loading,
              onTap: () => _verifyOtp(context, state),
              borderRadius: 12,
              height: 50,
            ),

            const SizedBox(height: AppSpacing.md),

            /// Resend OTP
            ResendOtpButton(isLoading: state.status == AppStatus.loading, onPressed: () => _resendOtp(context)),
          ],
        );
      },
    );
  }

  /* ---------------- Logic ---------------- */
  void _authListener(BuildContext context, AuthState state) {
    if (state.status == AppStatus.error && state.statusMessage.isNotEmpty) {
      QSnackBar.show(context, state.statusMessage);
    }

    if (state.isAuthenticated && state.status == AppStatus.loaded) {
      final role = state.role;
      if (role == null) {
        QSnackBar.show(context, 'User role not found');
        return;
      }

      if (role == UserRole.patient.name) {
        context.go(Routes.patientsHome);
      } else if (role == UserRole.doctor.name) {
        context.go(state.isProfileCompleted ? Routes.doctorHome : Routes.doctorCompleteProfile);
      }
    }
  }

  void _verifyOtp(BuildContext context, AuthState state) {
    final otp = _otpController.text.trim();

    if (otp.isEmpty) {
      QSnackBar.show(context, 'OTP cannot be empty');
      return;
    }

    if (otp.length != 6) {
      QSnackBar.show(context, 'Enter a valid 6-digit OTP');
      return;
    }

    final role = state.role;
    if (role == null) {
      QSnackBar.show(context, 'User role not found');
      return;
    }

    context.read<AuthBloc>().add(VerifyOtpEvent(email: widget.email, otp: otp, role: role));
  }

  void _resendOtp(BuildContext context) {
    context.read<AuthBloc>().add(RequestOtpEvent(email: widget.email, intent: widget.intent));
  }
}
