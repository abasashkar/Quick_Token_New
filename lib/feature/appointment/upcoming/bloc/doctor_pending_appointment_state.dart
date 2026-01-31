part of 'doctor_pending_appointment_bloc.dart';

class DoctorPendingAppointmentState {
  final AppStatus status;
  final List<AppointmentModel> pendingAppointments;
  final List<AppointmentModel> confirmedAppointments;
  final String statusMessage;

  const DoctorPendingAppointmentState({
    this.status = AppStatus.initial,
    this.pendingAppointments = const [],
    this.confirmedAppointments = const [],
    this.statusMessage = '',
  });

  factory DoctorPendingAppointmentState.initial() => const DoctorPendingAppointmentState();

  DoctorPendingAppointmentState copyWith({
    AppStatus? status,
    List<AppointmentModel>? pendingAppointments,
    List<AppointmentModel>? confirmedAppointments,
    String? statusMessage,
  }) {
    return DoctorPendingAppointmentState(
      status: status ?? this.status,
      pendingAppointments: pendingAppointments ?? this.pendingAppointments,
      confirmedAppointments: confirmedAppointments ?? this.confirmedAppointments,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }
}
