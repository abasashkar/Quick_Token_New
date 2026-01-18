import 'package:dio/dio.dart';
import 'package:quick_token_new/services/local_storage_service.dart';
import 'interceptor.dart'; // your custom interceptor file
class DioInstance {
  static final DioInstance instance = DioInstance._internal();
  late Dio dio;

  DioInstance._internal() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await LocalStorageServices()
              .read(key: LocalStorageKeys.authToken);

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
      ),
    );
  }
}
