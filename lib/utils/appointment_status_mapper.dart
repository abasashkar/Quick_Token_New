import 'package:quick_token_new/feature/appointment/widgets/appointment_card.dart';

extension AppointmentStatusMapper on String? {
  AppointmentStatus toAppointmentStatus() {
    switch (this) {
      case 'pending':
        return AppointmentStatus.pending;
      case 'confirmed':
      case 'accepted':
        return AppointmentStatus.confirmed;
      case 'completed':
        return AppointmentStatus.completed;
      case 'canceled':
      case 'rejected':
        return AppointmentStatus.canceled;
      default:
        return AppointmentStatus.pending;
    }
  }
}
