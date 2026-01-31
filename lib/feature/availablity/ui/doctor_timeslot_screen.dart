import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/feature/availablity/bloc/availablity_bloc.dart';
import 'package:quick_token_new/feature/availablity/ui/doctor_availablity_saved.dart';
import 'package:quick_token_new/feature/availablity/widgets/day_selector.dart';
import 'package:quick_token_new/feature/availablity/widgets/primary_button.dart';
import 'package:quick_token_new/feature/availablity/widgets/slot_selection.dart';
import 'package:quick_token_new/feature/availablity/widgets/time_picker.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class DoctorAvailabilityPage extends StatefulWidget {
  const DoctorAvailabilityPage({super.key});

  @override
  State<DoctorAvailabilityPage> createState() => _DoctorAvailabilityPageState();
}

class _DoctorAvailabilityPageState extends State<DoctorAvailabilityPage> {
  String _formatTime(TimeOfDay time) =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  int _slotDurationToMinutes(String value) => int.parse(value.split(' ').first);

  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final Set<String> selectedDays = {};

  TimeOfDay startTime = const TimeOfDay(hour: 10, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 16, minute: 0);
  TimeOfDay breakStart = const TimeOfDay(hour: 13, minute: 0);
  TimeOfDay breakEnd = const TimeOfDay(hour: 14, minute: 0);

  String slotDuration = '15 minutes';
  final List<String> slotOptions = ['15 minutes', '30 minutes', '45 minutes', '60 minutes'];

  static const double sectionGap = 24;
  static const double fieldGap = 12;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AvailablityBloc, AvailablityState>(
      listener: (context, state) {
        if (state.status == AppStatus.loaded && state.success) {
          // Navigate to success page
          Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorAvailabilitySuccessPage()));
        }

        if (state.status == AppStatus.error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.statusMessage), backgroundColor: Colors.red));
        }
      },
      child: QBasePage(
        labelWidget: const ExtraSmallText(text: 'Set Availability'),
        allowPopBack: true,
        enableScroll: true,
        addSafeSpace: true,
        children: [
          _sectionTitle('Working days'),
          const SizedBox(height: fieldGap),
          DaySelector(
            days: days,
            selectedDays: selectedDays.toList(),
            onDayToggle: (day) =>
                setState(() => selectedDays.contains(day) ? selectedDays.remove(day) : selectedDays.add(day)),
          ),
          const SizedBox(height: sectionGap),
          _sectionTitle('Working hours'),
          const SizedBox(height: fieldGap),
          TimePickerField(
            label: 'Start Time',
            selectedTime: startTime,
            onTimeChanged: (time) => setState(() => startTime = time),
          ),
          const SizedBox(height: fieldGap),
          TimePickerField(
            label: 'End Time',
            selectedTime: endTime,
            onTimeChanged: (time) => setState(() => endTime = time),
          ),
          const SizedBox(height: sectionGap),
          _sectionTitle('Slot duration'),
          const SizedBox(height: fieldGap),
          DropdownField(
            label: 'Slot Duration',
            options: slotOptions,
            selectedOption: slotDuration,
            onChanged: (value) {
              if (value != null) setState(() => slotDuration = value);
            },
          ),
          const SizedBox(height: sectionGap),
          _sectionTitle('Break time'),
          const SizedBox(height: fieldGap),
          TimePickerField(
            label: 'Break Start',
            selectedTime: breakStart,
            onTimeChanged: (time) => setState(() => breakStart = time),
          ),
          const SizedBox(height: fieldGap),
          TimePickerField(
            label: 'Break End',
            selectedTime: breakEnd,
            onTimeChanged: (time) => setState(() => breakEnd = time),
          ),
          const SizedBox(height: sectionGap + 8),
          BlocBuilder<AvailablityBloc, AvailablityState>(
            builder: (context, state) {
              return PrimaryButton(
                title: state.status == AppStatus.loading ? 'Saving...' : 'Save Availability',
                onPressed: state.status == AppStatus.loading ? null : _onSave,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) => ExtraSmallText(text: text, size: 18, color: Colors.black);

  void _onSave() {
    context.read<AvailablityBloc>().add(
      OnSaveAvailablityEvent(
        workingDays: selectedDays.toList(),
        startTime: _formatTime(startTime),
        endTime: _formatTime(endTime),
        slotDuration: _slotDurationToMinutes(slotDuration),
        breakStart: _formatTime(breakStart),
        breakEnd: _formatTime(breakEnd),
      ),
    );
  }
}
