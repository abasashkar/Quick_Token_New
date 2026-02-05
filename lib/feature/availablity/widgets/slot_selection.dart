import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';

class DropdownField extends StatelessWidget {
  final String label;
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String?> onChanged;

  const DropdownField({
    super.key,
    required this.label,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Qcolors.backgroundLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Qcolors.divider),
      ),
      child: Row(
        children: [
          /// Label
          Text(
            label,
            style: QStyles.body.copyWith(fontWeight: FontWeight.w500, color: Qcolors.primaryText),
          ),

          const Spacer(),

          /// Dropdown + Icon (together tappable)
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedOption,
              isExpanded: false,
              icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Qcolors.primaryText),
              style: QStyles.body.copyWith(color: Qcolors.primaryText),
              items: options.map((option) => DropdownMenuItem<String>(value: option, child: Text(option))).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
