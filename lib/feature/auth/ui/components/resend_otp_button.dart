import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';

class ResendOtpButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const ResendOtpButton({super.key, required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      child: Text('Resend OTP', style: QStyles.button.copyWith(color: Qcolors.primary)),
    );
  }
}
