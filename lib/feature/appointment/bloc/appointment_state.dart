part of 'appointment_bloc.dart';

class AppointmentState {
  final AppStatus status;
  final String statusMessage;
  final List<TimeSlot> slots;
  final String selectedTime;

  const AppointmentState({
    this.status = AppStatus.initial,
    this.statusMessage = '',
    this.slots = const [],
    this.selectedTime = '',
  });

  factory AppointmentState.initial() => const AppointmentState();

  AppointmentState copyWith({AppStatus? status, String? statusMessage, List<TimeSlot>? slots, String? selectedTime}) {
    return AppointmentState(
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
      slots: slots ?? this.slots,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}
