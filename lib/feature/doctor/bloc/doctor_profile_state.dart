part of 'doctor_profile_bloc.dart';

class DoctorProfileState {
  final AppStatus status;
  final String statusMessage;
  final bool success;

  final String specialization;
  final String location;

  const DoctorProfileState({
    this.status = AppStatus.initial,
    this.statusMessage = '',
    this.success = false,
    this.specialization = '',
    this.location = '',
  });

  factory DoctorProfileState.initial() {
    return const DoctorProfileState();
  }

  DoctorProfileState copyWith({
    AppStatus? status,
    String? statusMessage,
    bool? success,
    String? specialization,
    String? location,
  }) {
    return DoctorProfileState(
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
      success: success ?? this.success,
      specialization: specialization ?? this.specialization,
      location: location ?? this.location,
    );
  }
}
