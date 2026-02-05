import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/qsize.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';

class QTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;

  const QTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: QSizes.inputHeight,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        cursorColor: Qcolors.primary,
        style: QStyles.body.copyWith(
          color: Qcolors.primaryText, // ✅ FIX
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: QStyles.body.copyWith(color: Qcolors.secondaryText),
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: Qcolors.backgroundLight,
          contentPadding: const EdgeInsets.symmetric(horizontal: QSizes.md),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(QSizes.radiusMd), borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
