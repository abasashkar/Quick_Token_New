import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;

  const OtpInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Qcolors.backgroundLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Qcolors.divider),
        boxShadow: [BoxShadow(color: Qcolors.shadowLight, blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 6,
        textAlign: TextAlign.center,
        style: QStyles.h2.copyWith(color: Qcolors.primaryText),
        decoration: InputDecoration(
          hintText: '• • • • • •',
          hintStyle: QStyles.h2.copyWith(color: Qcolors.secondaryText),
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
