import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doctor_profile_event.dart';
part 'doctor_profile_state.dart';

class DoctorProfileBloc extends Bloc<DoctorProfileEvent, DoctorProfileState> {
  DoctorProfileBloc() : super(DoctorProfileInitial()) {
    on<DoctorProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
