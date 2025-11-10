import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/patient_model.dart';

class PatientService {
  final String baseUrl =
      "http://10.0.2.2:4000/api/patients"; // For Android emulator

  Future<Map<String, dynamic>> createPatient(PatientModel patient) async {
    final url = Uri.parse("$baseUrl/create");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(patient.toJson()),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to create patient: ${response.body}");
    }
  }

  Future<PatientModel> getPatientById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return PatientModel.fromJson(data);
    } else {
      throw Exception("failed to load patient:${response.body}");
    }
  }
}
