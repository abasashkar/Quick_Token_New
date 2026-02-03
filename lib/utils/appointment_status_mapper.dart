import 'package:quick_token_new/feature/appointment/widgets/appointment_card.dart';

extension AppointmentStatusMapper on String? {
  AppointmentStatus toAppointmentStatus() {
    final value = this?.toUpperCase();

    switch (value) {
      case 'PENDING':
        return AppointmentStatus.pending;

      case 'CONFIRMED':
      case 'ACCEPTED':
        return AppointmentStatus.confirmed;

      case 'COMPLETED':
        return AppointmentStatus.completed;

      case 'CANCELED':
      case 'REJECTED':
        return AppointmentStatus.canceled;

      default:
        return AppointmentStatus.pending;
    }
  }
}
