// import 'dart:convert';
// import 'package:quick_token_new/model/doctor_model.dart';
// import 'package:http/http.dart' as http;

// class DoctorService {
//   static const baseUrl = 'http://10.0.2.2:4000/api/doctors';
//   Future<List<Doctor>> fetchDoctor({String? searchQuery}) async {
//     final url = searchQuery != null && searchQuery.isNotEmpty ? '$baseUrl?search=$searchQuery' : baseUrl;

//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);
//       final List<dynamic> doctorsJson = data['doctors'];
//       return doctorsJson.map((e) => Doctor.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load doctors');
//     }
//   }
// }
