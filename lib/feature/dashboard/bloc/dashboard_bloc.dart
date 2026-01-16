import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/model/doctor_model.dart';
import 'package:quick_token_new/repository/doctores_repo..dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DoctorState> {
  final DoctorsRepo doctorsRepo;

  DashboardBloc({required this.doctorsRepo, required}) : super(DoctorState.initial()) {
    on<FetchDoctorsEvent>(_onFetchDoctorEvent);
  }
  //RegisterBloc({required this.authRepository, required AuthRepo authRepo}) : super(RegisterState.initial()) {

  Future<void> _onFetchDoctorEvent(FetchDoctorsEvent event, Emitter<DoctorState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      final doctors = await doctorsRepo.getDoctors();
      emit(state.copyWith(status: AppStatus.succuess, doctors: doctors));
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, statusMessage: e.toString()));
    }
  }
}
