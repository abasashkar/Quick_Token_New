class DoctorAvailablity {
  final String doctorId;
  final String date;
  final List<String> availableSlots;

  DoctorAvailablity({required this.doctorId, required this.date, required this.availableSlots});

  factory DoctorAvailablity.fromJson(Map<String, dynamic> json) {
    return DoctorAvailablity(
      doctorId: json['doctorId'] ?? '',
      date: json['date'],
      availableSlots: List<String>.from(json['availableSlots'] ?? []),
    );
  }
}
