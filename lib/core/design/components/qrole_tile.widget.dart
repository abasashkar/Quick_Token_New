import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/qsize.dart';
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
      child: InkWell(
        borderRadius: BorderRadius.circular(QSizes.radiusMd),
        onTap: onTap,
        child: Container(
          height: QSizes.roleTileHeight,
          decoration: BoxDecoration(
            color: isSelected ? Qcolors.primary.withOpacity(0.08) : Colors.transparent,
            borderRadius: BorderRadius.circular(QSizes.radiusMd),
            border: Border.all(color: isSelected ? Qcolors.primary : Qcolors.divider),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: QSizes.iconSm, color: isSelected ? Qcolors.primary : Qcolors.secondaryText),
              const SizedBox(width: QSizes.sm),
              Text(label, style: QStyles.body.copyWith(color: isSelected ? Qcolors.primary : Qcolors.primaryText)),
            ],
          ),
        ),
      ),
    );
  }
}
