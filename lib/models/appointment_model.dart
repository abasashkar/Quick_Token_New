// class AppointmentModel {
//   final String id;
//   final String doctorId;
//   final String patientName;
//   final String date;
//   final String time;
//   final String apptNo;
//   final String status;

//   AppointmentModel({
//     required this.id,
//     required this.doctorId,
//     required this.patientName,
//     required this.date,
//     required this.time,
//     required this.apptNo,
//     required this.status,
//   });

//   factory AppointmentModel.fromJson(Map<String, dynamic> json) {
//     return AppointmentModel(
//       id: json['_id'] ?? '',
//       doctorId: json['doctorId'] ?? '',
//       patientName: json['patientName'] ?? '',
//       date: json['date'] ?? '',
//       time: json['time'] ?? '',
//       apptNo: json['apptNo'] ?? '',
//       status: json['status'] ?? 'pending',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "doctorId": doctorId,
//       "patientName": patientName,
//       "date": date,
//       "time": time,
//       "apptNo": apptNo,
//       "status": status,
//     };
//   }
// }

class AppointmentModel {
  final String id;
  final String doctorId;
  final String patientName;
  final String date;
  final String time;
  final String apptNo;
  final String status;

  AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.patientName,
    required this.date,
    required this.time,
    required this.apptNo,
    required this.status,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['_id'] ?? '',
      doctorId: json['doctorId'] ?? '',
      patientName: json['patientName'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      apptNo: json['apptNo'] ?? '',
      status: json['status'] ?? 'pending',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "doctorId": doctorId,
      "patientName": patientName,
      "date": date,
      "time": time,
      "apptNo": apptNo,
      "status": status,
    };
  }

  AppointmentModel copyWith({String? status}) {
    return AppointmentModel(
      id: id,
      doctorId: doctorId,
      patientName: patientName,
      date: date,
      time: time,
      apptNo: apptNo,
      status: status ?? this.status,
    );
  }
}
