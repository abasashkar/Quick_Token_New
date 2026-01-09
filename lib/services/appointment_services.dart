import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quick_token_new/model/appointment_model.dart';

class AppointmentServices {
  static const baseUrl = 'http://10.0.2.2:4000/api/appointments';

  Future<AppointmentModel?> createAppointment(AppointmentModel appointment) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(appointment.toJson()),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return AppointmentModel.fromJson(data['appointment']); // ✅ backend returned object
    }

    return null;
  }

  Future<List<AppointmentModel>> getAppointmentsByDoctor(String doctorId) async {
    final response = await http.get(
      Uri.parse("$baseUrl/doctor/$doctorId"), // ✅ Correct REST route
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['appointments'];
      return list.map((json) => AppointmentModel.fromJson(json)).toList();
    }

    return [];
  }

  Future<bool> updateStatus(String apptId, String newStatus) async {
    final url = Uri.parse("$baseUrl/$apptId/status");

    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"status": newStatus}),
    );

    return response.statusCode == 200;
  }
}
