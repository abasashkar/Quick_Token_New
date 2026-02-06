import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/qsize.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';

class QPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;

  const QPrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    required int borderRadius,
    required int height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: QSizes.buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Qcolors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(QSizes.radiusMd)),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
              )
            : Text(text, style: QStyles.button),
      ),
    );
  }
}
