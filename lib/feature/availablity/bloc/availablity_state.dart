part of 'availablity_bloc.dart';

class AvailablityState {
  final AppStatus status;
  final String statusMessage;
  final bool success;

  final List<String> workingDays;
  final String startTime;
  final String endTime;
  final String breakStart;
  final String breakEnd;
  final int slotDuration;

  const AvailablityState({
    this.status = AppStatus.initial,
    this.statusMessage = '',
    this.success = false,
    this.workingDays = const [],
    this.startTime = '',
    this.endTime = '',
    this.breakStart = '',
    this.breakEnd = '',
    this.slotDuration = 0,
  });

  factory AvailablityState.initial() {
    return const AvailablityState();
  }

  AvailablityState copyWith({
    AppStatus? status,
    String? statusMessage,
    bool? success,
    List<String>? workingDays,
    String? startTime,
    String? endTime,
    String? breakStart,
    String? breakEnd,
    int? slotDuration, required List slots, required String selectedTime,
  }) {
    return AvailablityState(
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
      success: success ?? this.success,
      workingDays: workingDays ?? this.workingDays,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      breakStart: breakStart ?? this.breakStart,
      breakEnd: breakEnd ?? this.breakEnd,
      slotDuration: slotDuration ?? this.slotDuration,
    );
  }
}
