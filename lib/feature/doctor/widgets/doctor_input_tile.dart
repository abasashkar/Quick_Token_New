import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';

class ProfileInputTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;
  final VoidCallback? onTap;

  const ProfileInputTile({super.key, required this.icon, required this.label, this.iconColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Qcolors.backgroundLight),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? Qcolors.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label, style: QStyles.h1, selectionColor: Qcolors.success),
            ),
            const Icon(Icons.chevron_right, color: Qcolors.primary),
          ],
        ),
      ),
    );
  }
}
