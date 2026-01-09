import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class QPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;
  final Color backgroundColor;
  final IconData? icon;

  const QPrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.backgroundColor = const Color(0xFF4F8BFF),
    this.icon = Icons.navigate_next,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: isLoading ? null : onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [BoxShadow(color: backgroundColor.withOpacity(0.25), blurRadius: 8, offset: const Offset(0, 4))],
          ),
          child: isLoading
              ? const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ExtraSmallText(text: text, style: QStyles.title, color: Colors.white),
                    if (icon != null) ...[const SizedBox(width: 8), Icon(icon, size: 24, color: Colors.white)],
                  ],
                ),
        ),
      ),
    );
  }
}
