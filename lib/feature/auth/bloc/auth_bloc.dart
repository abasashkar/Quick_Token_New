import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_state.dart';
import 'package:quick_token_new/repository/auth_repo.dart';
import 'package:quick_token_new/services/auth_services.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  final AuthServices authServices;

  AuthBloc({required this.authRepo, required this.authServices}) : super(AuthState.initial()) {
    on<RequestOtpEvent>(_onRequestOtp);
    on<VerifyOtpEvent>(_onVerifyOtp);
    on<ResetAuthEvent>(_onResetAuth);
  }

  /// -------------------------
  /// REQUEST OTP
  /// -------------------------
  Future<void> _onRequestOtp(RequestOtpEvent event, Emitter<AuthState> emit) async {
    print('[AuthBloc] REQUEST OTP → email=${event.email}, intent=${event.intent.value}');
    emit(state.copyWith(status: AppStatus.loading, statusMessage: ''));

    try {
      final result = await authRepo.requestOTP(email: event.email, role: event.intent.value);

      final bool emailExists = result['emailExists'] == true;
      final String? backendRole = result['role'];
      print('[AuthBloc] OTP RESPONSE → emailExists=$emailExists, role=$backendRole');

      // Role mismatch handling
      if (emailExists && backendRole != null && backendRole != event.intent.value) {
        emit(
          state.copyWith(
            status: AppStatus.error,
            statusMessage: 'This email is already registered as ${backendRole.toUpperCase()}',
          ),
        );
        return;
      }

      // ✅ OTP sent successfully
      emit(
        state.copyWith(
          status: AppStatus.loaded,
          email: event.email,
          role: backendRole ?? event.intent.value,
          sendOTP: true,
        ),
      );

      print('[AuthBloc] OTP SENT → email=${event.email}, role=${backendRole ?? event.intent.value}');
    } catch (e, st) {
      print('[AuthBloc] REQUEST OTP ERROR → $e\n$st');
      emit(state.copyWith(status: AppStatus.error, statusMessage: e.toString()));
    }
  }

  /// -------------------------
  /// VERIFY OTP
  /// -------------------------
  Future<void> _onVerifyOtp(VerifyOtpEvent event, Emitter<AuthState> emit) async {
    print('[AuthBloc] VERIFY OTP → email=${event.email}, otp=${event.otp}, role=${event.role}');
    emit(state.copyWith(status: AppStatus.loading, statusMessage: ''));

    try {
      // Ensure role from backend exists
      if (state.role == null) {
        emit(state.copyWith(status: AppStatus.error, statusMessage: 'Role missing. Please request OTP again.'));
        return;
      }

      final token = await authRepo.verifyOTP(
        otp: event.otp,
        email: event.email,
        role: state.role!, // ✅ Use backend-confirmed role
      );
      await authServices.saveSession(role: state.role!, token: token);
      final savedToken = await authServices.authToken;
      final savedRole = await authServices.role;

      print('🧪 STORED TOKEN (IMMEDIATE): $savedToken');
      print('🧪 STORED ROLE (IMMEDIATE): $savedRole');

      emit(
        state.copyWith(
          status: AppStatus.loaded,
          isAuthenticated: true,
          role: state.role, 
        ),
      );

      print('[AuthBloc] OTP VERIFIED → email=${event.email}, role=${state.role}, token=$token');
    } catch (e, st) {
      print('[AuthBloc] VERIFY OTP ERROR → $e\n$st');
      emit(state.copyWith(status: AppStatus.error, statusMessage: e.toString()));
    }
  }

  void _onResetAuth(ResetAuthEvent event, Emitter<AuthState> emit) {
    print('[AuthBloc] RESET AUTH');
    emit(AuthState.initial());
  }
}
