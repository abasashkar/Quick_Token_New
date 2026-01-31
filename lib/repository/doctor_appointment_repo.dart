import 'package:dio/dio.dart';
import 'package:quick_token_new/core/constants/api_routes.dart';
import 'package:quick_token_new/excepion/api_exception.dart';
import 'package:quick_token_new/model/appointment_model.dart';
import 'package:quick_token_new/services/api_response.dart';
import 'package:quick_token_new/services/api_service.dart';
import 'package:quick_token_new/services/local_storage_service.dart';

class DoctorAppointmentRepo extends ApiServices {
  DoctorAppointmentRepo({required this.localStorage});
  final LocalStorageServices localStorage;

  Options _authOptions(String token) => Options(headers: {"Authorization": "Bearer $token"});

  /// 🔹 PENDING
  Future<ApiResponse<List<AppointmentModel>>> getPendingAppointments() async {
    try {
      final token = await localStorage.read(key: LocalStorageKeys.authToken);

      final response = await dio.get(ApiRoutes.doctorPendingAppointments, options: _authOptions(token!));

      final data = response.data;

      final appointments = (data['appointments'] as List).map((e) => AppointmentModel.fromJson(e)).toList();

      return ApiResponse(data: appointments, success: true, error: null, statusCode: response.statusCode ?? 200);
    } catch (e) {
      final exception = ApiErrorHandler().handleError(e);
      return ApiResponse(
        data: [],
        success: false,
        error: ApiError(message: exception.toString()),
        statusCode: 0,
      );
    }
  }

  /// 🔹 CONFIRMED (ALL)
  Future<ApiResponse<List<AppointmentModel>>> getConfirmedAppointments() async {
    try {
      final token = await localStorage.read(key: LocalStorageKeys.authToken);

      final response = await dio.get(ApiRoutes.doctorConfirmedAppointments, options: _authOptions(token!));

      final appointments = (response.data['appointments'] as List).map((e) => AppointmentModel.fromJson(e)).toList();

      return ApiResponse(data: appointments, success: true, error: null, statusCode: response.statusCode ?? 200);
    } catch (e) {
      final exception = ApiErrorHandler().handleError(e);
      return ApiResponse(
        data: [],
        success: false,
        error: ApiError(message: exception.toString()),
        statusCode: 0,
      );
    }
  }

  /// 🔹 ACCEPT
  /// 🔹 ACCEPT
  Future<ApiResponse<AppointmentModel>> acceptAppointment(String appointmentId) async {
    try {
      final token = await localStorage.read(key: LocalStorageKeys.authToken);

      print("📤 [ACCEPT] Appointment ID: $appointmentId");
      print("📤 [ACCEPT] Token exists: ${token != null}");

      final response = await dio.patch(ApiRoutes.acceptAppointment(appointmentId), options: _authOptions(token!));

      // 🔥 MOST IMPORTANT LOG
      print("📥 [ACCEPT] Status Code: ${response.statusCode}");
      print("📥 [ACCEPT] Response Data: ${response.data}");

      final appointment = AppointmentModel.fromJson(response.data['appointment']);

      print("✅ [ACCEPT] Parsed Appointment:");
      print("   ➤ id: ${appointment.id}");
      print("   ➤ status: ${appointment.status}");
      print("   ➤ token: ${appointment.tokenNumber}");

      return ApiResponse(data: appointment, success: true, error: null, statusCode: response.statusCode ?? 200);
    } catch (e, stack) {
      // 🔥 ERROR SIDE LOGS
      print("❌ [ACCEPT] ERROR OCCURRED");
      print("❌ [ACCEPT] Exception: $e");
      print("❌ [ACCEPT] StackTrace: $stack");

      final exception = ApiErrorHandler().handleError(e);
      print("❌ [ACCEPT] Handled Error: $exception");

      return ApiResponse(data: null, success: false, error: ApiError(message: exception.toString()), statusCode: 0);
    }
  }

  /// 🔹 REJECT
  Future<ApiResponse<AppointmentModel>> rejectAppointment(String appointmentId) async {
    try {
      final token = await localStorage.read(key: LocalStorageKeys.authToken);

      final response = await dio.patch(ApiRoutes.rejectAppointment(appointmentId), options: _authOptions(token!));

      final appointment = AppointmentModel.fromJson(response.data['appointment']);

      return ApiResponse(data: appointment, success: true, error: null, statusCode: response.statusCode ?? 200);
    } catch (e) {
      final exception = ApiErrorHandler().handleError(e);
      return ApiResponse(data: null, success: false, error: ApiError(message: exception.toString()), statusCode: 0);
    }
  }
}
