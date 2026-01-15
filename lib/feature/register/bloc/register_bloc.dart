import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/repository/auth_repo.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepo authRepository;

  RegisterBloc({required this.authRepository, required AuthRepo authRepo}) : super(RegisterState.initial()) {
    on<OnSelectedRole>(_onSelectedRole);
    on<OnRegister>(_onRegister);
  }

  void _onSelectedRole(OnSelectedRole event, Emitter<RegisterState> emit) {
    emit(state.copyWith(role: event.type.name));
  }

  Future<void> _onRegister(OnRegister event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));

    try {
      final res = await authRepository.register(email: event.email, role: event.role, name: event.name);

      emit(
        state.copyWith(
          status: AppStatus.loaded,
          success: res['success'],
          emailExists: res['emailExists'],
          statusMessage: res['message'],
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, statusMessage: e.toString()));
    }
  }
}
