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
    } catch (e) {
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

      // Call backend to verify OTP and get token
      final result = await authRepo.verifyOTP(otp: event.otp, email: event.email, role: role);

      // Assuming your backend returns token, name, email
      final token = result['token'];
      final name = result['name']; // <-- Add this
      final email = result['email']; // <-- Add this

      await authServices.saveSession(role: role, token: token);

      emit(
        state.copyWith(
          status: AppStatus.loaded,
          isAuthenticated: true,
          role: role,
          name: name, // <-- Store name
          email: email, // <-- Store email
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, statusMessage: e.toString()));
    }
  }

  void _onResetAuth(ResetAuthEvent event, Emitter<AuthState> emit) {
    emit(AuthState.initial());
  }
}
