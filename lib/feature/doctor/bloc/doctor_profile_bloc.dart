import 'package:bloc/bloc.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/repository/doctores_repo.dart';

part 'doctor_profile_event.dart';
part 'doctor_profile_state.dart';

class DoctorProfileBloc extends Bloc<DoctorProfileEvent, DoctorProfileState> {
  final DoctorsRepo doctorsRepo;

  DoctorProfileBloc({required this.doctorsRepo}) : super(DoctorProfileState.initial()) {
    on<OnUpdateDoctorProfileEvent>(_onUpdateDoctorProfile);
  }

  Future<void> _onUpdateDoctorProfile(OnUpdateDoctorProfileEvent event, Emitter<DoctorProfileState> emit) async {
    emit(state.copyWith(status: AppStatus.loading, statusMessage: '', success: false));

    try {
      final response = await doctorsRepo.updateDoctorProfile(
        specialization: event.specialization,
        location: event.location,
      );

      emit(
        state.copyWith(
          status: response.success ? AppStatus.loaded : AppStatus.error,
          success: response.success,
          statusMessage: response.success
              ? 'Profile updated successfully'
              : response.error?.message ?? 'Something went wrong',
          specialization: event.specialization,
          location: event.location,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, statusMessage: e.toString(), success: false));
    }
  }
}
