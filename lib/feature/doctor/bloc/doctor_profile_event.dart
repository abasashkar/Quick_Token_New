part of 'doctor_profile_bloc.dart';

sealed class DoctorProfileEvent {
  const DoctorProfileEvent();
}

/// 🔹 UPDATE DOCTOR PROFILE
class OnUpdateDoctorProfileEvent extends DoctorProfileEvent {
  final String specialization;
  final String location;

  const OnUpdateDoctorProfileEvent({required this.specialization, required this.location});
}
