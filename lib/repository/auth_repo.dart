import 'package:quick_token_new/core/constants/api_routes.dart';
import 'package:quick_token_new/services/api_service.dart';

class AuthRepo extends ApiServices {
  /// REGISTER USER
  Future<Map<String, dynamic>> register({required String email, required String role, required String name}) async {
    try {
      final response = await post(ApiRoutes.register, {'email': email, 'role': role, 'name': name});

      final data = response.data;

      if (data == null) {
        return {'success': false, 'emailExists': false, 'message': 'Empty response from server'};
      }

      if (response.statusCode == 201) {
        return {
          'success': true,
          'emailExists': false,
          'message': 'Registered successfully',
          'user': data['message'], // name/email/role
        };
      }

      return {'success': false, 'emailExists': false, 'message': 'Registration failed'};
    } catch (e) {
      rethrow;
    }
  }

  /// REQUEST OTP → returns role from backend
  Future<Map<String, dynamic>> requestOTP({required String email, required String role}) async {
    try {
      final response = await post(ApiRoutes.sendOtp, {'email': email, 'role': role});

      final data = response.data;
      if (data == null) throw Exception('Empty response from server');

      final responseData = data['data'];
      if (responseData == null || responseData is! Map<String, dynamic>) {
        throw Exception('Invalid OTP response format');
      }

      final backendRole = responseData['role'];
      if (backendRole == null) {
        throw Exception('Role missing in OTP response');
      }

      return {
        'emailExists': data['emailExists'] == true, // safe even if missing
        'role': backendRole as String,
      };
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> verifyOTP({required String otp, required String email, required String role}) async {
    final response = await post(ApiRoutes.verifyOtp, {'otp': otp, 'email': email, 'role': role});

    final raw = response.data;
    if (raw == null) throw Exception('Invalid server response');

    final data = raw['data'] as Map<String, dynamic>?;
    if (data == null) throw Exception(raw['message']?.toString() ?? 'OTP verification failed');

    final token = data['token'] as String?;
    final name = data['name'] as String?; // get from backend
    final userEmail = data['email'] as String?; // get from backend

    if (token == null || token.isEmpty) throw Exception('Token missing in server response');

    return {'token': token, 'name': name ?? '', 'email': userEmail ?? email};
  }
}
