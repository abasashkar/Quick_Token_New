part of 'book_appointment_bloc.dart';

abstract class BookAppointmentEvent {}

class SubmitBooking extends BookAppointmentEvent {
  final String doctorId;
  final String date;
  final String slot;

  SubmitBooking({required this.doctorId, required this.date, required this.slot});
}

class ResetBooking extends BookAppointmentEvent {}
