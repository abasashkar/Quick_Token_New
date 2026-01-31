import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';

class AvailabilitySummaryCard extends StatelessWidget {
  final List<String> workingDays;
  final String startTime;
  final String endTime;
  final String breakStart;
  final String breakEnd;
  final int slotDuration;

  const AvailabilitySummaryCard({
    super.key,
    required this.workingDays,
    required this.startTime,
    required this.endTime,
    required this.breakStart,
    required this.breakEnd,
    required this.slotDuration,
  });

  String get workingDaysString => workingDays.join(', ');

  String get slotDurationString => '$slotDuration minutes';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Qcolors.backgroundLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Qcolors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Working days
          Text(workingDaysString, style: QStyles.title.copyWith(color: Qcolors.primaryText)),

          const SizedBox(height: 6),

          // Working hours
          Text('$startTime - $endTime', style: QStyles.bodyLarge.copyWith(color: Qcolors.primaryText)),

          const SizedBox(height: 12),
          Divider(color: Qcolors.divider),
          const SizedBox(height: 12),

          // Break time
          Text('Break: $breakStart - $breakEnd', style: QStyles.bodySmall.copyWith(color: Qcolors.secondaryText)),

          const SizedBox(height: 6),

          // Slot duration
          Text('Slot Duration: $slotDurationString', style: QStyles.bodySmall.copyWith(color: Qcolors.secondaryText)),
        ],
      ),
    );
  }
}
