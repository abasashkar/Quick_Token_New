import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';

class TimePickerField extends StatelessWidget {
  final String label;
  final TimeOfDay selectedTime;
  final ValueChanged<TimeOfDay> onTimeChanged;

  const TimePickerField({super.key, required this.label, required this.selectedTime, required this.onTimeChanged});

  Future<void> _pickTime(BuildContext context) async {
    final picked = await showTimePicker(context: context, initialTime: selectedTime);

    if (picked != null) {
      onTimeChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickTime(context),
      child: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          children: [
            /// Label
            Expanded(
              child: Text(label, style: QStyles.body.copyWith(color: Colors.black)),
            ),

            /// Time
            Text(selectedTime.format(context), style: QStyles.body.copyWith(color: Colors.black)),

            const SizedBox(width: 12),

            /// Clock icon
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Icon(Icons.access_time, size: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
