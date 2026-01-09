import 'package:quick_token_new/core/constants/api_routes.dart';
import 'package:quick_token_new/services/api_service.dart';

class AuthRepo extends ApiServices {
  /// Request OTP → returns the role from backend
  Future<Map<String, dynamic>> requestOTP({required String email, required String role}) async {
    final response = await post(ApiRoutes.sendOtp, {'email': email, 'role': role});
    final data = response.data as Map<String, dynamic>;

    print('REQUEST OTP RESPONSE: $data'); // 🔥 debug log

    if (!data.containsKey('role')) {
      throw Exception('Role missing in OTP response');
    }

    return {'emailExists': data['emailExists'] ?? false, 'role': data['role']};
  }

  /// Verify OTP → returns JWT token
  Future<String> verifyOTP({required String otp, required String email, required String role}) async {
    final response = await post(ApiRoutes.verifyOtp, {'otp': otp, 'email': email, 'role': role});

    final data = response.data;

    if (data == null || data is! Map<String, dynamic>) {
      throw Exception('Invalid server response');
    }

    if (!data.containsKey('token')) {
      // 👇 show backend message if available
      throw Exception(data['message'] ?? 'OTP verification failed');
    }

    return data['token'];
  }
}
