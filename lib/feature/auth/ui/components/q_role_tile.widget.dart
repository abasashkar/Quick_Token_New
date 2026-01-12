import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';

class QRoleTile extends StatelessWidget {
  final bool isSelected;
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const QRoleTile({super.key, required this.isSelected, required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 52,
          decoration: BoxDecoration(
            color: isSelected ? Qcolors.primary : Qcolors.backgroundLight,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: isSelected ? Qcolors.primary : Qcolors.divider, width: 1.2),
            boxShadow: isSelected
                ? [BoxShadow(color: Qcolors.primary.withOpacity(0.25), blurRadius: 10, offset: const Offset(0, 4))]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20, color: isSelected ? Qcolors.onPrimaryText : Qcolors.secondaryText),
              const SizedBox(width: 8),
              Text(
                label,
                style: QStyles.subtitle.copyWith(color: isSelected ? Qcolors.onPrimaryText : Qcolors.primaryText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
