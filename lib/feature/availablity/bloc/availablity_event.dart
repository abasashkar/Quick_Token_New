part of 'availablity_bloc.dart';

@immutable
sealed class AvailablityEvent {
  const AvailablityEvent();
}

/// SAVE DOCTOR AVAILABILITY
class OnSaveAvailablityEvent extends AvailablityEvent {
  final List<String> workingDays;
  final String startTime;
  final String endTime;
  final int slotDuration;
  final String breakStart;
  final String breakEnd;

  const OnSaveAvailablityEvent({
    required this.workingDays,
    required this.startTime,
    required this.endTime,
    required this.slotDuration,
    required this.breakStart,
    required this.breakEnd,
  });
}
