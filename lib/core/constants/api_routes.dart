class ApiRoutes {
  static const String baseUrl = 'http://10.0.2.2:4000';
  static const String register = '$baseUrl/api/auth/register';
  static const String sendOtp = '$baseUrl/api/auth/send-otp';
  static const String verifyOtp = '$baseUrl/api/auth/verify-otp';
  static const String getDoctors = '$baseUrl/api/doctors';
  static const String doctorAvailability = '$baseUrl/api/doctors/availability';
  static const String getAvailableSlots = '$baseUrl/api/appointments/slots';
  static const String bookAppointment = '$baseUrl/api/appointments/book';
  static const String doctorPendingAppointments = '$baseUrl/api/appointments/doctor/pending';
  static String acceptAppointment(String id) => '$baseUrl/api/appointments/$id/accept';
  static String rejectAppointment(String id) => '$baseUrl/api/appointments/$id/reject';
  static const String doctorTodayAppointments = '$baseUrl/api/appointments/doctor/today';
  static const String doctorConfirmedAppointments = '$baseUrl/api/appointments/doctor/confirmed';
  static const String patientAppointments = '$baseUrl/api/appointments/my';
  static const String updateDoctorProfile = '$baseUrl/api/doctors/profile';
}
