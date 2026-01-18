import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quick_token_new/core/constants/api_routes.dart';
import '../model/doctor_model.dart';

class DoctorsRepo {
  Future<List<Doctor>> getDoctors() async {
    final response = await http.get(Uri.parse(ApiRoutes.getDoctors));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['doctors'];

      return list.map((e) => Doctor.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load doctors');
    }
  }
}


