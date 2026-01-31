import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/model/appointment_model.dart';
import 'package:quick_token_new/repository/book_appointment_repo.dart';

part 'book_appointment_event.dart';
part 'book_appointment_state.dart';

class BookAppointmentBloc extends Bloc<BookAppointmentEvent, BookAppointmentState> {
  final BookAppointmentRepo repo;

  BookAppointmentBloc({required this.repo}) : super(BookAppointmentState.initial()) {
    on<SubmitBooking>(_onSubmitBooking);
    on<ResetBooking>((_, emit) => emit(BookAppointmentState.initial()));
  }

  Future<void> _onSubmitBooking(SubmitBooking event, Emitter<BookAppointmentState> emit) async {
    debugPrint('🟡 SubmitBooking triggered');
    emit(state.copyWith(status: AppStatus.loading));

    final response = await repo.bookAppointment(doctorId: event.doctorId, date: event.date, slot: event.slot);

    debugPrint('🟢 Booking API response: ${response.success}');

    if (response.success && response.data != null) {
      emit(state.copyWith(status: AppStatus.succuess, appointment: response.data));
    } else {
      emit(state.copyWith(status: AppStatus.error, statusMessage: response.error?.message ?? 'Booking failed'));
    }
  }
}
