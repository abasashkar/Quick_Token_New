import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';

class AppointmentStatusTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const AppointmentStatusTabs({super.key, required this.selectedIndex, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final tabs = ["Pending", "Confirmed"];

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: List.generate(
          tabs.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selectedIndex == index ? Qcolors.primary : Qcolors.backgroundLight,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue),
                ),
                child: Text(
                  tabs[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selectedIndex == index ? Qcolors.onPrimaryText : Qcolors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
