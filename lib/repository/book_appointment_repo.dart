import 'package:dio/dio.dart';
import 'package:quick_token_new/core/constants/api_routes.dart';
import 'package:quick_token_new/excepion/api_exception.dart';
import 'package:quick_token_new/model/appointment_model.dart';
import 'package:quick_token_new/services/api_response.dart';
import 'package:quick_token_new/services/api_service.dart';
import 'package:quick_token_new/services/local_storage_service.dart';

class BookAppointmentRepo extends ApiServices {
  BookAppointmentRepo({required this.localStorage});
  final LocalStorageServices localStorage;

  /// POST /api/appointments/book
  Future<ApiResponse<AppointmentModel>> bookAppointment({
    required String doctorId,
    required String date,
    required String slot,
  }) async {
    try {
      // ✅ READ TOKEN CORRECTLY
      final token = await localStorage.read(key: LocalStorageKeys.authToken);

      final response = await dio.post(
        ApiRoutes.bookAppointment,
        data: {"doctorId": doctorId, "date": date, "slot": slot},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      final data = response.data;

      if (data == null || data['appointment'] == null) {
        return ApiResponse(
          data: null,
          success: false,
          error: ApiError(message: "Appointment data missing"),
          statusCode: response.statusCode ?? 500,
        );
      }

      final appointment = AppointmentModel.fromJson(data['appointment']);

      return ApiResponse(data: appointment, success: true, error: null, statusCode: response.statusCode ?? 200);
    } catch (e) {
      final exception = ApiErrorHandler().handleError(e);

      return ApiResponse(
        data: null,
        success: false,
        error: ApiError(
          message: exception is ApiException ? exception.message ?? exception.generalMessage : exception.toString(),
        ),
        statusCode: 0,
      );
    }
  }
}
