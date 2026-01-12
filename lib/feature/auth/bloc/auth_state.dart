// auth_state.dart
import 'package:quick_token_new/core/enums/app_status.dart';

enum AuthType { login, register }

class AuthState {
  final AppStatus status;
  final String statusMessage;
  final String? email;
  final String? role; 
  final bool isAuthenticated;
  final bool sendOTP;
  final AuthType authtype;

  AuthState({
    this.status = AppStatus.loaded,
    this.statusMessage = '',
    this.email,
    this.role,
    this.sendOTP = false,
    this.isAuthenticated = false,
    this.authtype = AuthType.login,
  });

  factory AuthState.initial() {
    return AuthState(status: AppStatus.initial);
  }

  AuthState copyWith({
    AppStatus? status,
    String? statusMessage,
    String? email,
    String? role,
    bool? sendOTP,
    bool? isAuthenticated,
    AuthType? authtype,
  }) {
    return AuthState(
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
      email: email ?? this.email,
      role: role ?? this.role,
      sendOTP: sendOTP ?? this.sendOTP,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      authtype: authtype ?? this.authtype,
    );
  }
}
