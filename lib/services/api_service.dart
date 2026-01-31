import 'package:dio/dio.dart';
import 'package:quick_token_new/excepion/api_exception.dart';
import 'package:quick_token_new/services/api_response.dart';
import 'package:quick_token_new/utils/dio_instance.dart';

abstract class ApiServices {
  final Dio _dio = DioInstance.instance.dio;

  Dio get dio => _dio;

  Future<ApiResponse<Map<String, dynamic>>> post(String url, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(url, data: data);

      return ApiResponse(
        data: response.data,
        error: null,
        success: response.statusCode == 200 || response.statusCode == 201,
        statusCode: response.statusCode ?? 0,
      );
    } catch (e) {
      final exception = ApiErrorHandler().handleError(e);

      return ApiResponse(data: null, error: ApiError(message: exception.toString()), success: false, statusCode: 0);
    }
  }
}
