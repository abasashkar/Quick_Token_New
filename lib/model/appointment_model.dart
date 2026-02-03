class AppointmentModel {
  final String id;
  final String? doctorId;
  final String? patientId;
  final String? patientName;
  final String date;
  final String slot;
  final int? tokenNumber;
  final String status;
  final String? doctorName;

  AppointmentModel({
    required this.id,
    required this.date,
    required this.slot,
    required this.status,
    this.doctorId,
    this.patientId,
    this.patientName,
    this.tokenNumber,
    this.doctorName,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['_id'] ?? '',
      doctorId: json['doctorId'] is Map ? json['doctorId']['_id'] : json['doctorId'],
      patientId: json['patientId'] is Map ? json['patientId']['_id'] : json['patientId'],
      patientName: json['patientId'] is Map ? json['patientId']['name'] : null,
      date: json['date'] ?? '',
      slot: json['slot'] ?? '',
      tokenNumber: json['tokenNumber'],
      status: (json['status'] as String).toUpperCase(),
      doctorName: json['doctorId'] is Map ? json['doctorId']['name'] : null,
    );
  }

  /// FIXED copyWith
  AppointmentModel copyWith({
    String? status,
    String? date,
    String? slot,
    String? doctorId,
    String? patientId,
    String? patientName,
    int? tokenNumber,
    String? doctorName,
  }) {
    return AppointmentModel(
      id: id,
      date: date ?? this.date,
      slot: slot ?? this.slot,
      status: status ?? this.status,
      doctorId: doctorId ?? this.doctorId,
      patientId: patientId ?? this.patientId,
      patientName: patientName ?? this.patientName,
      tokenNumber: tokenNumber ?? this.tokenNumber,
      doctorName: doctorName ?? this.doctorName,
    );
  }
}
