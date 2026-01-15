import 'package:quick_token_new/core/constants/api_routes.dart';
import 'package:quick_token_new/services/api_service.dart';

class AuthRepo extends ApiServices {
  /// REGISTER USER
  Future<Map<String, dynamic>> register({required String email, required String role, required String name}) async {
    try {
      final response = await post(ApiRoutes.register, {'email': email, 'role': role, 'name': name});

      final data = response.data as Map<String, dynamic>?;

      if (data == null) {
        return {'success': false, 'emailExists': false, 'message': 'Empty response from server'};
      }

      print('REGISTER RESPONSE: $data');

      if (response.statusCode == 201) {
        return {
          'success': true,
          'emailExists': false,
          'message': 'Registered successfully',
          'user': data['message'], // name/email/role
        };
      }

      return {'success': false, 'emailExists': false, 'message': 'Registration failed'};
    } catch (e, stackTrace) {
      print('❌ REGISTER API FAILED → $e\n$stackTrace');
      rethrow;
    }
  }

  /// REQUEST OTP → returns role from backend
  Future<Map<String, dynamic>> requestOTP({required String email, required String role}) async {
    try {
      final response = await post(ApiRoutes.sendOtp, {'email': email, 'role': role});

      final data = response.data as Map<String, dynamic>?;
      if (data == null) throw Exception('Empty response from server');

      print('REQUEST OTP RESPONSE: $data');

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
    } catch (e, st) {
      print('❌ REQUEST OTP FAILED → $e\n$st');
      rethrow;
    }
  }

  Future<String> verifyOTP({required String otp, required String email, required String role}) async {
    try {
      final response = await post(ApiRoutes.verifyOtp, {'otp': otp, 'email': email, 'role': role});

      final raw = response.data as Map<String, dynamic>?;
      if (raw == null) throw Exception('Invalid server response');

      final data = raw['data'];
      if (data == null || data is! Map<String, dynamic>) {
        throw Exception(raw['message']?.toString() ?? 'OTP verification failed');
      }

      final token = data['token'];
      if (token is String && token.isNotEmpty) {
        return token;
      }

      throw Exception('Token missing in server response');
    } catch (e, st) {
      print('❌ VERIFY OTP FAILED → $e\n$st');
      rethrow;
    }
  }
}
