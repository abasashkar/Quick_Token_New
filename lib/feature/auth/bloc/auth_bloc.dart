import 'package:bloc/bloc.dart';
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

  Future<void> _onRequestOtp(RequestOtpEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AppStatus.loading, statusMessage: ''));

    try {
      final result = await authRepo.requestOTP(email: event.email, role: event.intent.value);

      final bool emailExists = result['emailExists'] == true;
      final String backendRole = result['role'] ?? event.intent.value;

      print('[AuthBloc] OTP RESPONSE → emailExists=$emailExists, role=$backendRole');

      // Role mismatch handling
      if (emailExists && backendRole != event.intent.value) {
        emit(
          state.copyWith(
            status: AppStatus.error,
            statusMessage: 'This email is already registered as ${backendRole.toUpperCase()}',
          ),
        );
        return;
      }

      emit(state.copyWith(status: AppStatus.loaded, email: event.email, role: backendRole, sendOTP: true));

      print('[AuthBloc] OTP SENT → email=${event.email}, role=$backendRole');
    } catch (e, st) {
      print('[AuthBloc] REQUEST OTP ERROR → $e\n$st');
      emit(state.copyWith(status: AppStatus.error, statusMessage: e.toString()));
    }
  }

  Future<void> _onVerifyOtp(VerifyOtpEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AppStatus.loading, statusMessage: ''));

    try {
      final role = state.role;
      if (role == null || role.isEmpty) {
        emit(state.copyWith(status: AppStatus.error, statusMessage: 'Please select a role'));
        return;
      }

      final token = await authRepo.verifyOTP(otp: event.otp, email: event.email, role: role);

      await authServices.saveSession(role: role, token: token);

      print('🧪 STORED TOKEN (IMMEDIATE): ${await authServices.authToken}');
      print('🧪 STORED ROLE (IMMEDIATE): ${await authServices.role}');

      emit(state.copyWith(status: AppStatus.loaded, isAuthenticated: true, role: role));
      print('[AuthBloc] OTP VERIFIED → email=${event.email}, role=$role, token=$token');
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
