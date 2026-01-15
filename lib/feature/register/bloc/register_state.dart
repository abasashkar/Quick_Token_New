part of 'register_bloc.dart';



class RegisterState {
  final AppStatus status;
  final String statusMessage;
  final String? email;
  final String? role;
  final String? name;
  final bool success;
  final bool emailExists;


  RegisterState({
    this.status = AppStatus.loaded,
    this.statusMessage = '',
    this.email,
    this.role,
    this.name,
    this.success = false,
    this.emailExists = false,

  });

  factory RegisterState.initial() {
    return RegisterState(status: AppStatus.initial);
  }

  RegisterState copyWith({
    AppStatus? status,
    String? statusMessage,
    String? email,
    String? role,
    String? name,
    bool? success,
    bool? emailExists,

  }) {
    return RegisterState(
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
      email: email ?? this.email,
      role: role ?? this.role,
      name: name ?? this.name,
      success: success ?? this.success,
      emailExists: emailExists ?? this.emailExists,

    );
  }
}
