import 'package:dio/dio.dart';
import 'interceptor.dart'; // your custom interceptor file

class DioInstance {
  // Private constructor
  DioInstance._internal() {
    _dio = Dio()..interceptors.add(CustomInterceptor()); // Use your custom interceptor
  }

  // Single instance
  static final DioInstance _singleton = DioInstance._internal();

  static DioInstance get instance => _singleton;

  late final Dio _dio;

  Dio get dio => _dio;
}
