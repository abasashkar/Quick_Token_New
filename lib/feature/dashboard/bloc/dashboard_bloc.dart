// dashboard_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/model/doctor_model.dart';
import 'package:quick_token_new/repository/doctores_repo.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DoctorState> {
  final DoctorsRepo doctorsRepo;

  DashboardBloc({required this.doctorsRepo}) : super(DoctorState.initial()) {
    on<FetchDoctorsEvent>(_fetchDoctors);
    on<SearchDoctorsEvent>(_searchDoctors);
    on<SelectCategoryEvent>(_selectCategory);
  }

  Future<void> _fetchDoctors(FetchDoctorsEvent event, Emitter<DoctorState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));

    try {
      final response = await doctorsRepo.getDoctors();

      if (response.success) {
        emit(
          state.copyWith(
            status: AppStatus.succuess,
            doctors: response.data, // ✅ THIS WAS MISSING
          ),
        );
      } else {
        emit(
          state.copyWith(status: AppStatus.error, statusMessage: response.error?.message ?? "Failed to load doctors"),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, statusMessage: e.toString()));
    }
  }

  void _searchDoctors(SearchDoctorsEvent event, Emitter<DoctorState> emit) {
    emit(state.copyWith(searchQuery: event.query));
  }

  void _selectCategory(SelectCategoryEvent event, Emitter<DoctorState> emit) {
    emit(state.copyWith(selectedCategory: event.category));
  }
}







// // import 'package:bloc/bloc.dart';
// // import 'package:meta/meta.dart';

// // import 'package:quick_token_new/core/enums/app_status.dart';
// // import 'package:quick_token_new/model/doctor_model.dart';
// // import 'package:quick_token_new/repository/doctores_repo.dart';

// // part 'dashboard_event.dart';
// // part 'dashboard_state.dart';

// // class DashboardBloc extends Bloc<DashboardEvent, DoctorState> {
// //   final DoctorsRepo doctorsRepo;

// //   DashboardBloc({required this.doctorsRepo}) : super(DoctorState.initial()) {
// //     on<FetchDoctorsEvent>(_onFetchDoctorEvent);
// //   }


// //   Future<void> _onFetchDoctorEvent(FetchDoctorsEvent event, Emitter<DoctorState> emit) async {
// //     emit(state.copyWith(status: AppStatus.loading));
// //     try {
// //       final doctors = await doctorsRepo.getDoctors();
// //       emit(state.copyWith(status: AppStatus.succuess, doctors: doctors));
// //     } catch (e) {
// //       emit(state.copyWith(status: AppStatus.error, statusMessage: e.toString()));
// //     }
// //   }
// // }