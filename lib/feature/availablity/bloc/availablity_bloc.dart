import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/repository/doctor_availablity_repo.dart';

part 'availablity_event.dart';
part 'availablity_state.dart';

class AvailablityBloc extends Bloc<AvailablityEvent, AvailablityState> {
  final DoctorAvailabilityRepo availabilityRepo;

  AvailablityBloc({required this.availabilityRepo}) : super(AvailablityState.initial()) {
    on<OnSaveAvailablityEvent>(_onSaveAvailability);
  }

  Future<void> _onSaveAvailability(OnSaveAvailablityEvent event, Emitter<AvailablityState> emit) async {
    emit(state.copyWith(status: AppStatus.loading, slots: [], selectedTime: ''));

    try {
      final response = await availabilityRepo.saveAvailability(
        workingDays: event.workingDays,
        startTime: event.startTime,
        endTime: event.endTime,
        slotDuration: event.slotDuration,
        breakStart: event.breakStart,
        breakEnd: event.breakEnd,
      );

      emit(
        state.copyWith(
          status: AppStatus.loaded,
          success: response.success,
          statusMessage: response.success
              ? 'Availability saved successfully'
              : response.error?.message ?? 'Something went wrong',
          // ✅ Save values in state
          workingDays: event.workingDays,
          startTime: event.startTime,
          endTime: event.endTime,
          breakStart: event.breakStart,
          breakEnd: event.breakEnd,
          slotDuration: event.slotDuration,
          slots: [],
          selectedTime: '',
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, statusMessage: e.toString(), slots: [], selectedTime: ''));
    }
  }
}
