import 'package:dio/dio.dart';
import 'package:quick_token_new/core/constants/api_routes.dart';
import 'package:quick_token_new/excepion/api_exception.dart';
import 'package:quick_token_new/model/doctor_model.dart';
import 'package:quick_token_new/services/api_response.dart';
import 'package:quick_token_new/services/api_service.dart';
import 'package:quick_token_new/services/local_storage_service.dart';

class DoctorsRepo extends ApiServices {
  DoctorsRepo({required this.localStorage});

  final LocalStorageServices localStorage;

  Options _authOptions(String token) => Options(headers: {"Authorization": "Bearer $token"});

  /// GET ALL DOCTORS
  Future<ApiResponse<List<Doctor>>> getDoctors() async {
    try {
      final response = await dio.get(ApiRoutes.getDoctors);

      final doctors = (response.data['doctors'] as List).map((e) => Doctor.fromJson(e)).toList();

      return ApiResponse(data: doctors, success: true, error: null, statusCode: response.statusCode ?? 200);
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

  /// UPDATE DOCTOR PROFILE
  Future<ApiResponse<Doctor>> updateDoctorProfile({required String specialization, required String location}) async {
    try {
      final token = await localStorage.read(key: LocalStorageKeys.authToken);

      final response = await dio.put(
        ApiRoutes.updateDoctorProfile,
        data: {"specialization": specialization, "location": location},
        options: _authOptions(token!),
      );

      final doctor = Doctor.fromJson(response.data['doctor']);

      return ApiResponse(data: doctor, success: true, error: null, statusCode: response.statusCode ?? 200);
    } catch (e) {
      final exception = ApiErrorHandler().handleError(e);
      return ApiResponse(data: null, success: false, error: ApiError(message: exception.toString()), statusCode: 0);
    }
  }
}
