import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quick_token_new/models/appointment_model.dart';

class AppointmentServices {
  static const baseUrl = 'http://10.0.2.2:4000/api/appointments';

  Future<bool> createAppointment(AppointmentModel appointment) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(appointment.toJson()),
    );

    return response.statusCode == 201;
  }

  Future<List<AppointmentModel>> getAppointmentsByDoctor(
    String doctorId,
  ) async {
    final response = await http.get(Uri.parse("$baseUrl/$doctorId")); // ✅ FIXED

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['appointments'];
      return list.map((json) => AppointmentModel.fromJson(json)).toList();
    }
    return [];
  }

  Future<bool> updateStatus(String apptId, String newStatus) async {
    final url = Uri.parse("$baseUrl/$apptId/status"); // matches backend

    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"status": newStatus}),
    );

    return response.statusCode == 200;
  }
}
