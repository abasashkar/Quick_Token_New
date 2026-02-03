import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';

class ProfileInputTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ProfileInputTile({super.key, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Qcolors.backgroundLight),
        ),
        child: Row(
          children: [
            Icon(icon, color: Qcolors.primary, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
