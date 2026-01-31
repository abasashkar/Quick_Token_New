import 'package:bloc/bloc.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/model/appointment_model.dart';
import 'package:quick_token_new/repository/patient_appointment_repo.dart';

part 'patient_upcomingg_appointment_event.dart';
part 'patient_upcomingg_appointment_state.dart';

class PatientUpcominggAppointmentBloc extends Bloc<PatientUpcominggAppointmentEvent, PatientUpcominggAppointmentState> {
  final PatientAppointmentRepo repo;
  PatientUpcominggAppointmentBloc({required this.repo}) : super(PatientUpcominggAppointmentState.initial()) {
    on<FetchPatientUpcominggAppointmentEvent>(_onFetch);
  }

  Future<void> _onFetch(
    FetchPatientUpcominggAppointmentEvent event,
    Emitter<PatientUpcominggAppointmentState> emit,
  ) async {
    emit(state.copyWith(status: AppStatus.loading, pendingAppointments: [], confirmedAppointments: []));

    final response = await repo.getUpcomingAppointments();

    if (response.success) {
      final pending = response.data!.where((e) => e.status == 'PENDING').toList();

      final confirmed = response.data!.where((e) => e.status == 'CONFIRMED').toList();

      emit(state.copyWith(status: AppStatus.succuess, pendingAppointments: pending, confirmedAppointments: confirmed));
    } else {
      emit(
        state.copyWith(
          status: AppStatus.error,
          statusMessage: response.error?.message ?? 'Failed',
          pendingAppointments: [],
          confirmedAppointments: [],
        ),
      );
    }
  }
}
