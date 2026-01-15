class ApiRoutes {
  static const String _baseUrl = 'http://10.0.2.2:4000';
  static const String register = '$_baseUrl/api/auth/register';
  static const String sendOtp = '$_baseUrl/api/auth/send-otp';
  static const String verifyOtp = '$_baseUrl/api/auth/verify-otp';
}
