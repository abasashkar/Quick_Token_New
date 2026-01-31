import 'package:dio/dio.dart';
import 'package:quick_token_new/core/constants/api_routes.dart';
import 'package:quick_token_new/excepion/api_exception.dart';
import 'package:quick_token_new/model/appointment_model.dart';
import 'package:quick_token_new/services/api_response.dart';
import 'package:quick_token_new/services/api_service.dart';
import 'package:quick_token_new/services/local_storage_service.dart';

class PatientAppointmentRepo extends ApiServices {
  PatientAppointmentRepo({required this.localStorage});

  final LocalStorageServices localStorage;

  Options _authtokens(String token) => Options(headers: {"Authorization": "Bearer $token"});

  Future<ApiResponse<List<AppointmentModel>>> getUpcomingAppointments() async {
    try {
      final token = await localStorage.read(key: LocalStorageKeys.authToken);
      final response = await dio.get(ApiRoutes.patientAppointments, options: _authtokens(token!));

      final data = response.data;
      if (data == null || data['appointments'] == null) {
        return ApiResponse(
          data: [],
          success: false,
          error: ApiError(message: "No appointments for today"),
          statusCode: response.statusCode ?? 500,
        );
      }

      final appointmentsJson = (data['appointments'] as List);
      final appointments = appointmentsJson.map((e) => AppointmentModel.fromJson(e)).toList();
      return ApiResponse(data: appointments, success: true, error: null, statusCode: response.statusCode ?? 200);
    } catch (e) {
      final exception = ApiErrorHandler().handleError(e);
      return ApiResponse(
        data: [],
        success: false,
        error: ApiError(
          message: exception is ApiException ? exception.message ?? exception.generalMessage : exception.toString(),
        ),
        statusCode: 0,
      );
    }
  }
}
