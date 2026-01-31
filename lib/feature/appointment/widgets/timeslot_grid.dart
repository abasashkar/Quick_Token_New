import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/model/time_slot_model.dart';

class TimeSlotGrid extends StatelessWidget {
  final List<TimeSlot> slots;
  final String selectedTime;
  final Function(String) onTimeSelected;

  const TimeSlotGrid({super.key, required this.slots, required this.selectedTime, required this.onTimeSelected});

  /// ✅ Converts "10:15 AM" or "10:15:00" → "10:15"
  String _normalizeSlot(String time) {
    // Case: 10:15:00
    if (time.contains(':') && time.length >= 5) {
      return time.substring(0, 5);
    }
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.8,
      ),
      itemCount: slots.length,
      itemBuilder: (context, index) {
        final slot = slots[index];

        /// 🔥 NORMALIZED VALUE
        final cleanTime = _normalizeSlot(slot.time);
        final isSelected = cleanTime == selectedTime;

        return GestureDetector(
          onTap: slot.isBooked
              ? null
              : () {
                  debugPrint('🕒 Selected slot (API): $cleanTime');
                  onTimeSelected(cleanTime); // ✅ FIX
                },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _backgroundColor(isSelected, slot.isBooked),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: _borderColor(isSelected, slot.isBooked)),
            ),
            child: Text(
              slot.isBooked ? 'Booked' : slot.time, // UI stays same
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: _textColor(isSelected, slot.isBooked)),
            ),
          ),
        );
      },
    );
  }

  Color _backgroundColor(bool selected, bool booked) {
    if (booked) return Colors.grey.shade200;
    if (selected) return Qcolors.primary;
    return Colors.white;
  }

  Color _borderColor(bool selected, bool booked) {
    if (booked) return Colors.grey.shade300;
    if (selected) return Qcolors.primary;
    return Colors.grey.shade300;
  }

  Color _textColor(bool selected, bool booked) {
    if (booked) return Colors.grey;
    if (selected) return Colors.white;
    return Colors.black87;
  }
}
