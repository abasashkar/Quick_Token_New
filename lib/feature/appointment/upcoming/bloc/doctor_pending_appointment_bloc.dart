import 'package:bloc/bloc.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/model/appointment_model.dart';
import 'package:quick_token_new/repository/doctor_appointment_repo.dart';

part 'doctor_pending_appointment_event.dart';
part 'doctor_pending_appointment_state.dart';

class DoctorPendingAppointmentBloc extends Bloc<DoctorPendingAppointmentEvent, DoctorPendingAppointmentState> {
  final DoctorAppointmentRepo repo;

  DoctorPendingAppointmentBloc({required this.repo}) : super(DoctorPendingAppointmentState.initial()) {
    on<FetchPendingAppointmentsEvent>(_fetchPending);
    on<FetchConfirmedAppointmentsEvent>(_fetchConfirmed);
    on<AcceptAppointmentEvent>(_accept);
    on<RejectAppointmentEvent>(_reject);
  }

  // ========================= FETCH PENDING =========================
  Future<void> _fetchPending(FetchPendingAppointmentsEvent event, Emitter<DoctorPendingAppointmentState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));

    final res = await repo.getPendingAppointments();

    if (res.success) {
      emit(state.copyWith(status: AppStatus.succuess, pendingAppointments: res.data ?? []));
    } else {
      emit(state.copyWith(status: AppStatus.error, statusMessage: res.error?.message ?? 'Error'));
    }
  }

  // ========================= FETCH CONFIRMED =========================
  Future<void> _fetchConfirmed(
    FetchConfirmedAppointmentsEvent event,
    Emitter<DoctorPendingAppointmentState> emit,
  ) async {
    emit(state.copyWith(status: AppStatus.loading));

    final res = await repo.getConfirmedAppointments();

    if (res.success) {
      emit(state.copyWith(status: AppStatus.succuess, confirmedAppointments: res.data ?? []));
    } else {
      emit(state.copyWith(status: AppStatus.error, statusMessage: res.error?.message ?? 'Error'));
    }
  }

  // ========================= ACCEPT APPOINTMENT =========================
  Future<void> _accept(AcceptAppointmentEvent event, Emitter<DoctorPendingAppointmentState> emit) async {
    final index = state.pendingAppointments.indexWhere((e) => e.id == event.appointmentId);

    if (index == -1) return;

    final appointment = state.pendingAppointments[index];

    // Optimistic remove from pending
    emit(state.copyWith(pendingAppointments: state.pendingAppointments.where((e) => e.id != appointment.id).toList()));

    final res = await repo.acceptAppointment(event.appointmentId);

    if (res.success && res.data != null) {
      emit(
        state.copyWith(confirmedAppointments: [...state.confirmedAppointments, res.data!], status: AppStatus.succuess),
      );
    } else {
      // revert on failure
      emit(state.copyWith(pendingAppointments: [...state.pendingAppointments, appointment]));
    }
  }

  // ========================= REJECT APPOINTMENT =========================
  Future<void> _reject(RejectAppointmentEvent event, Emitter<DoctorPendingAppointmentState> emit) async {
    final appointmentIndex = state.pendingAppointments.indexWhere((e) => e.id == event.appointmentId);
    if (appointmentIndex == -1) {
      return;
    }

    final appointment = state.pendingAppointments[appointmentIndex];

    // Optimistic update: remove from pending
    final updatedPending = state.pendingAppointments.where((e) => e.id != appointment.id).toList();
    emit(state.copyWith(pendingAppointments: updatedPending));

    // Call API
    final res = await repo.rejectAppointment(event.appointmentId);

    if (!res.success || res.data == null) {
      // Revert if API fails or data is null
      emit(state.copyWith(pendingAppointments: [...state.pendingAppointments, appointment]));
    } else {}
  }
}
