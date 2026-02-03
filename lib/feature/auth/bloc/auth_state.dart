// auth_state.dart
import 'package:quick_token_new/core/enums/app_status.dart';

enum AuthType { login, register }

class AuthState {
  final AppStatus status;
  final String statusMessage;
  final String? email;
  final String? role;
  final bool isAuthenticated;
  final String? name;
  final bool sendOTP;
  final AuthType authtype;
  final bool isProfileCompleted;

  AuthState({
    this.status = AppStatus.loaded,
    this.statusMessage = '',
    this.email,
    this.name,
    this.role,
    this.sendOTP = false,
    this.isAuthenticated = false,
    this.authtype = AuthType.login,
    this.isProfileCompleted = false,
  });

  factory AuthState.initial() {
    return AuthState(status: AppStatus.initial);
  }

  AuthState copyWith({
    AppStatus? status,
    String? statusMessage,
    String? email,
    String? name,
    String? role,
    bool? sendOTP,
    bool? isAuthenticated,
    AuthType? authtype,
    bool? isProfileCompleted,
  }) {
    return AuthState(
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      sendOTP: sendOTP ?? this.sendOTP,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      authtype: authtype ?? this.authtype,
      isProfileCompleted: isProfileCompleted ?? this.isProfileCompleted,
    );
  }
}
