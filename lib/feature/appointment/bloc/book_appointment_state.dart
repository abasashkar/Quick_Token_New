part of 'book_appointment_bloc.dart';

class BookAppointmentState {
  final AppStatus status;
  final String statusMessage;
  final AppointmentModel? appointment;

  const BookAppointmentState({this.status = AppStatus.initial, this.statusMessage = '', this.appointment});

  factory BookAppointmentState.initial() => const BookAppointmentState();

  BookAppointmentState copyWith({AppStatus? status, String? statusMessage, AppointmentModel? appointment}) {
    return BookAppointmentState(
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
      appointment: appointment ?? this.appointment,
    );
  }
}
