import 'package:dio/dio.dart';
import 'package:quick_token_new/excepion/app_exception.dart';

class ApiException extends AppException {
  ApiException({super.message, required super.generalMessage});
}

class BadRequestException extends ApiException {
  BadRequestException({super.message, required super.generalMessage});
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({super.message, required super.generalMessage});
}

class ForbiddenException extends ApiException {
  ForbiddenException({super.message, required super.generalMessage});
}

class NotFoundException extends ApiException {
  NotFoundException({super.message, required super.generalMessage});
}

class ConflictException extends ApiException {
  ConflictException({super.message, required super.generalMessage});
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException({super.message, required super.generalMessage});
}

class BadGatewayException extends ApiException {
  BadGatewayException({super.message, required super.generalMessage});
}

class ServiceUnavailableException extends ApiException {
  ServiceUnavailableException({super.message, required super.generalMessage});
}

class ApiErrorHandler {
  Exception handleError(dynamic error) {
    if (error is DioException) {
      final status = error.response?.statusCode;

      String message = 'Something went wrong';

      final data = error.response?.data;

      if (data is Map<String, dynamic>) {
        message = data['message']?.toString() ?? message;
      } else if (data is String) {
        message = data;
      } else if (error.message != null) {
        message = error.message!;
      }

      switch (status) {
        case 400:
          return BadRequestException(message: message, generalMessage: 'Bad request');
        case 401:
          return UnauthorizedException(message: message, generalMessage: 'Unauthorized');
        case 409:
          return ConflictException(message: message, generalMessage: 'Conflict');
        case 404:
          return NotFoundException(message: message, generalMessage: 'Not found');
        case 500:
          return InternalServerErrorException(message: message, generalMessage: 'Server error');
        default:
          return ApiException(message: message, generalMessage: 'Unknown error');
      }
    }

    return ApiException(message: error.toString(), generalMessage: 'Unknown error');
  }
}
