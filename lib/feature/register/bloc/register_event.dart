part of 'register_bloc.dart';

abstract class RegisterEvent {}

class OnSelectedRole extends RegisterEvent {
  final UserRole type;
  OnSelectedRole(this.type);
}

class OnRegister extends RegisterEvent {
  final String email;
  final String name;
  final String role;

  OnRegister({required this.email, required this.name, required this.role});
}
