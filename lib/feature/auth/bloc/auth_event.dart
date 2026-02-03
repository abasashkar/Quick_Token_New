// auth_event.dart
part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RequestOtpEvent extends AuthEvent {
  final String email;
  final UserRole intent;

  RequestOtpEvent({required this.email, required this.intent});
}

class VerifyOtpEvent extends AuthEvent {
  final String email;
  final String otp;
  final String role; // ✅ add role

  VerifyOtpEvent({
    required this.email,
    required this.otp,
    required this.role, // ✅ pass role here
  });
}

class UpdateProfileCompletedEvent extends AuthEvent {
  final bool isCompleted;
  UpdateProfileCompletedEvent({required this.isCompleted});
}

class ResetAuthEvent extends AuthEvent {}
