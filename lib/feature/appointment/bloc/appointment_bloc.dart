import 'package:bloc/bloc.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/model/time_slot_model.dart';
import 'package:quick_token_new/repository/doctor_availablity_repo.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final DoctorAvailabilityRepo doctorAvailabilityRepo;

  AppointmentBloc(this.doctorAvailabilityRepo, {required appointmentRepo}) : super(AppointmentState.initial()) {
    on<FetchAvailableSlots>(_onFetchSlots);
    on<SelectTimeSlot>(_onSelectTime);
  }

  void _onSelectTime(SelectTimeSlot event, Emitter<AppointmentState> emit) {
    emit(state.copyWith(selectedTime: event.time));
  }

  Future<void> _onFetchSlots(FetchAvailableSlots event, Emitter<AppointmentState> emit) async {
    emit(state.copyWith(status: AppStatus.loading, slots: [], selectedTime: ''));

    try {
      final response = await doctorAvailabilityRepo.getAvailableSlots(doctorId: event.doctorId, date: event.date);

      if (response.success && response.data != null) {
        emit(state.copyWith(status: AppStatus.loaded, slots: response.data!));
      } else {
        emit(
          state.copyWith(
            status: AppStatus.error,
            statusMessage: response.error?.message ?? 'Failed to load available slots',
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, statusMessage: 'Something went wrong'));
    }
  }
}
