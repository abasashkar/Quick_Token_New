part of 'appointment_bloc.dart';

sealed class AppointmentEvent {
  const AppointmentEvent();
}

class SelectTimeSlot extends AppointmentEvent {
  final String time;
  const SelectTimeSlot(this.time);
}

final class FetchAvailableSlots extends AppointmentEvent {
  final String doctorId;
  final String date; // yyyy-MM-dd

  const FetchAvailableSlots({required this.doctorId, required this.date});
}
