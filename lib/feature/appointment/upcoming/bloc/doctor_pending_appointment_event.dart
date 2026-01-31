part of 'doctor_pending_appointment_bloc.dart';

abstract class DoctorPendingAppointmentEvent {}

class FetchPendingAppointmentsEvent extends DoctorPendingAppointmentEvent {}

class FetchConfirmedAppointmentsEvent extends DoctorPendingAppointmentEvent {}

class AcceptAppointmentEvent extends DoctorPendingAppointmentEvent {
  final String appointmentId;
  AcceptAppointmentEvent(this.appointmentId);
}

class RejectAppointmentEvent extends DoctorPendingAppointmentEvent {
  final String appointmentId;
  RejectAppointmentEvent(this.appointmentId);
}
