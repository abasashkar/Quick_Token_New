import 'package:dio/dio.dart' hide Response;
import 'package:quick_token_new/excepion/api_exception.dart';
import 'package:quick_token_new/core/models/response.dart';
import 'package:quick_token_new/utils/dio_instance.dart';

abstract class ApiServices {
  final Dio _dio = DioInstance.instance.dio;

  Future<Response> get(String url, [Map<String, dynamic>? queryParams]) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParams);
      return Response.fromJson(response.data);
    } catch (e) {
      throw ApiErrorHandler().handleError(e);
    }
  }

  Future<Response> post(String url, Map<String, dynamic> data, [Map<String, dynamic>? queryParams]) async {
    try {
      final response = await _dio.post(url, data: data, queryParameters: queryParams);
      return Response.fromJson(response.data);
    } catch (e) {
      throw ApiErrorHandler().handleError(e);
    }
  }

  Future<Response> put(String url, Map<String, dynamic> data, [Map<String, dynamic>? queryParams]) async {
    try {
      final response = await _dio.put(url, data: data, queryParameters: queryParams);
      return Response.fromJson(response.data);
    } catch (e) {
      throw ApiErrorHandler().handleError(e);
    }
  }

  Future<Response> delete(String url, [Map<String, dynamic>? queryParams]) async {
    try {
      final response = await _dio.delete(url);
      return Response.fromJson(response.data);
    } catch (e) {
      throw ApiErrorHandler().handleError(e);
    }
  }

  Future<Response> patch(String url, Map<String, dynamic> data, [Map<String, dynamic>? queryParams]) async {
    try {
      final response = await _dio.patch(url, data: data, queryParameters: queryParams);
      return Response.fromJson(response.data);
    } catch (e) {
      throw ApiErrorHandler().handleError(e);
    }
  }
}
