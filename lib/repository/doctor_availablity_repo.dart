// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quick_token_new/core/constants/api_routes.dart';
import 'package:quick_token_new/excepion/api_exception.dart';
import 'package:quick_token_new/model/time_slot_model.dart';
import 'package:quick_token_new/services/api_response.dart';
import 'package:quick_token_new/services/api_service.dart';
import 'package:quick_token_new/services/local_storage_service.dart';

class DoctorAvailabilityRepo extends ApiServices {
  DoctorAvailabilityRepo({required this.localStorage});
  final LocalStorageServices localStorage;

  Future<ApiResponse<Map<String, dynamic>>> saveAvailability({
    required List<String> workingDays,
    required String startTime,
    required String endTime,
    required int slotDuration,
    required String breakStart,
    required String breakEnd,
  }) async {
    return await post(ApiRoutes.doctorAvailability, {
      "workingDays": workingDays,
      "startTime": startTime,
      "endTime": endTime,
      "slotDuration": slotDuration,
      "breakStart": breakStart,
      "breakEnd": breakEnd,
    });
  }

  /// GET AVAILABLE SLOTS
  /// Patient
  //  → Select Doctor
  //  → Select Date
  //  → GET /appointments/slots   ✅
  //  → Choose Slot
  //  → POST /appointments/book

  Future<ApiResponse<List<TimeSlot>>> getAvailableSlots({required String doctorId, required String date}) async {
    try {
      final response = await dio.get(
        ApiRoutes.getAvailableSlots,
        queryParameters: {'doctorId': doctorId, 'date': date},
      );

      final data = response.data;

      // Support multiple backend formats safely
      List rawSlots = [];

      if (data is Map<String, dynamic>) {
        rawSlots = data['availableSlots'] ?? data['data'] ?? [];
      }

      final slots = rawSlots.map((e) => TimeSlot(time: e.toString())).toList();

      return ApiResponse(data: slots, success: true, error: null, statusCode: response.statusCode ?? 200);
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
