part of 'dashboard_bloc.dart';

class DoctorState {
  final AppStatus status;
  final String statusMessage;
  final List<Doctor> doctors;
  final String searchQuery;
  final String selectedCategory;

  DoctorState({
    this.status = AppStatus.loaded,
    this.statusMessage = '',
    this.doctors = const [],
    this.searchQuery = '',
    this.selectedCategory = 'All',
  });

  factory DoctorState.initial() {
    return DoctorState(status: AppStatus.initial);
  }

  DoctorState copyWith({
    AppStatus? status,
    String? statusMessage,
    List<Doctor>? doctors,
    String? searchQuery,
    String? selectedCategory,
  }) {
    return DoctorState(
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
      doctors: doctors ?? this.doctors,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
