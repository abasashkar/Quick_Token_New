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
    print("📌 [_fetchPending] Fetching pending appointments...");
    emit(state.copyWith(status: AppStatus.loading));

    final res = await repo.getPendingAppointments();

    if (res.success) {
      print("✅ [_fetchPending] Loaded ${res.data?.length ?? 0} pending appointments");
      emit(state.copyWith(status: AppStatus.succuess, pendingAppointments: res.data ?? []));
    } else {
      print("❌ [_fetchPending] Error: ${res.error?.message}");
      emit(state.copyWith(status: AppStatus.error, statusMessage: res.error?.message ?? 'Error'));
    }
  }

  // ========================= FETCH CONFIRMED =========================
  Future<void> _fetchConfirmed(
    FetchConfirmedAppointmentsEvent event,
    Emitter<DoctorPendingAppointmentState> emit,
  ) async {
    print("📌 [_fetchConfirmed] Fetching confirmed appointments...");
    emit(state.copyWith(status: AppStatus.loading));

    final res = await repo.getConfirmedAppointments();

    if (res.success) {
      print("✅ [_fetchConfirmed] Loaded ${res.data?.length ?? 0} confirmed appointments");
      emit(state.copyWith(status: AppStatus.succuess, confirmedAppointments: res.data ?? []));
    } else {
      print("❌ [_fetchConfirmed] Error: ${res.error?.message}");
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
    print("📌 [_reject] Attempting to reject appointment: ${event.appointmentId}");

    final appointmentIndex = state.pendingAppointments.indexWhere((e) => e.id == event.appointmentId);
    if (appointmentIndex == -1) {
      print("⚠️ [_reject] Appointment not found in pending list!");
      return;
    }

    final appointment = state.pendingAppointments[appointmentIndex];
    print("📌 [_reject] Found pending appointment: ${appointment.patientName}");

    // Optimistic update: remove from pending
    final updatedPending = state.pendingAppointments.where((e) => e.id != appointment.id).toList();
    emit(state.copyWith(pendingAppointments: updatedPending));
    print("📌 [_reject] Optimistic removal applied. Pending: ${updatedPending.length}");

    // Call API
    final res = await repo.rejectAppointment(event.appointmentId);
    print("📌 [_reject] API response: success=${res.success}, data=${res.data}");

    if (!res.success || res.data == null) {
      // Revert if API fails or data is null
      emit(state.copyWith(pendingAppointments: [...state.pendingAppointments, appointment]));
      print("❌ [_reject] API failed or returned null. Reverted changes.");
    } else {
      print("✅ [_reject] Appointment rejected successfully.");
    }
  }
}
