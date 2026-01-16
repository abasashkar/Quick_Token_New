class ApiRoutes {
  static const String baseUrl = 'http://10.0.2.2:4000';
  static const String register = '$baseUrl/api/auth/register';
  static const String sendOtp = '$baseUrl/api/auth/send-otp';
  static const String verifyOtp = '$baseUrl/api/auth/verify-otp';
  static const String getDoctors = '$baseUrl/api/doctors';
}
