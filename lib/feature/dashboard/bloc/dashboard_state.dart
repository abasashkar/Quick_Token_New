// dashboard_state.dart
part of 'dashboard_bloc.dart';

class DoctorState {
  final AppStatus status;
  final String statusMessage;
  final List<Doctor> doctors;
  final String searchQuery;
  final String selectedCategory;

  const DoctorState({
    required this.status,
    required this.statusMessage,
    required this.doctors,
    required this.searchQuery,
    required this.selectedCategory,
  });

  factory DoctorState.initial() {
    return const DoctorState(
      status: AppStatus.initial,
      statusMessage: '',
      doctors: [],
      searchQuery: '',
      selectedCategory: 'All',
    );
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
