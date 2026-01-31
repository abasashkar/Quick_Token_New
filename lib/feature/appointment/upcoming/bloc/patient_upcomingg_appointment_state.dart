part of 'patient_upcomingg_appointment_bloc.dart';

class PatientUpcominggAppointmentState {
  final AppStatus status;
  final List<AppointmentModel> pendingAppointments;
  final List<AppointmentModel> confirmedAppointments;
  final String statusMessage;

  PatientUpcominggAppointmentState({
    this.status = AppStatus.initial,
    this.pendingAppointments = const [],
    this.confirmedAppointments = const [],
    this.statusMessage = '',
  });

  factory PatientUpcominggAppointmentState.initial() => PatientUpcominggAppointmentState();

  PatientUpcominggAppointmentState copyWith({
    AppStatus? status,
    List<AppointmentModel>? pendingAppointments,
    List<AppointmentModel>? confirmedAppointments,
    String? statusMessage,
  }) {
    return PatientUpcominggAppointmentState(
      status: status ?? this.status,
      pendingAppointments: pendingAppointments ?? this.pendingAppointments,
      confirmedAppointments: confirmedAppointments ?? this.confirmedAppointments,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }
}
