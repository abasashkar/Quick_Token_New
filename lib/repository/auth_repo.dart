import 'package:quick_token_new/core/constants/api_routes.dart';
import 'package:quick_token_new/services/api_service.dart';

class AuthRepo extends ApiServices {
  Future<Map<String, dynamic>> register({required String email, required String role, required String name}) async {
    final response = await post(ApiRoutes.register, {'email': email, 'role': role, 'name': name});

    final data = response.data;

    if (data is Map<String, dynamic>) {
      return {
        'success': data['success'] == true,
        'emailExists': data['message']?.toString().toLowerCase().contains('exist') == true,
        'message': data['message'] ?? 'Something went wrong',
      };
    }

    // ✅ Network / unexpected error
    return {
      'success': false,
      'emailExists': response.error?.message.toLowerCase().contains('exist') == true,
      'message': response.error?.message ?? 'Server error',
    };
  }

  Future<Map<String, dynamic>> requestOTP({required String email, required String role}) async {
    try {
      final response = await post(ApiRoutes.sendOtp, {'email': email, 'role': role});

      final data = response.data;
      if (data == null) throw Exception('Empty response from server');

      final responseData = data['data'] as Map<String, dynamic>?;

      if (responseData == null) {
        throw Exception('Invalid OTP response format');
      }

      return {'emailExists': data['emailExists'] == true, 'role': responseData['role']};
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// VERIFY OTP
  Future<Map<String, dynamic>> verifyOTP({required String otp, required String email, required String role}) async {
    final response = await post(ApiRoutes.verifyOtp, {'otp': otp, 'email': email, 'role': role});

    final raw = response.data;
    if (raw == null) throw Exception('Invalid server response');

    final data = raw['data'] as Map<String, dynamic>?;
    if (data == null) {
      throw Exception(raw['message']?.toString() ?? 'OTP verification failed');
    }

    return {'token': data['token'], 'name': data['name'] ?? '', 'email': data['email'] ?? email};
  }
}
