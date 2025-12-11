import 'dart:convert';
import 'package:quick_token_new/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static const baseUrl = 'http://10.0.2.2:4000';

  static Future<bool> sendOtp(String email, String role) async {
    final url = Uri.parse('$baseUrl/api/auth/send-otp');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'role': role}),
    );

    final data = jsonDecode(response.body);
    return data['success'] == true;
  }

  static Future<UserModel?> verifyOtp(
    String email,
    String otp,
    String role,
  ) async {
    final url = Uri.parse('$baseUrl/api/auth/verify-otp');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'otp': otp, 'role': role}),
    );

    final data = jsonDecode(response.body);

    if (data['success'] == true) {
      return UserModel(email: email, token: data['token'], role: '');
    } else {
      throw Exception(data['message'] ?? 'OTP verification failed');
    }
  }
}

// working one

// class AuthServices {
//   static const baseUrl = 'http://10.0.2.2:4000';

//   static Future<UserModel?> register(String email, String password) async {
//     final url = Uri.parse('$baseUrl/api/auth/register');
//     final response = await http.post(
//       url,
//       body: jsonEncode({'email': email, 'password': password}),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return UserModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to register: ${response.body}');
//     }
//   }

//   static Future<UserModel?> login(String email, String password) async {
//     final url = Uri.parse('$baseUrl/api/auth/login');
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'password': password}),
//     );

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return UserModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to login: ${response.body}');
//     }
//   }

//   static Future<bool> sendOtp(String email) async {
//     final url = Uri.parse('$baseUrl/api/auth/send-otp'); // ✅ fixed
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email}),
//     );

//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200 && data['success'] == true) {
//       print("✅ OTP sent successfully to $email");
//       return true;
//     } else {
//       print("❌ Failed to send OTP: ${data['message']}");
//       return false;
//     }
//   }

//   static Future<UserModel?> verifyOtp(String email, String otp) async {
//     final url = Uri.parse('$baseUrl/api/auth/verify-otp'); // ✅ fixed
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'otp': otp}),
//     );

//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200 && data['success'] == true) {
//       print("✅ OTP verified successfully");
//       return UserModel(email: email, token: data['token']);
//     } else {
//       throw Exception(data['message'] ?? 'OTP verification failed');
//     }
//   }
// }
