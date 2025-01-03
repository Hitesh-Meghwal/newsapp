import 'package:dio/dio.dart';

class DioErrorHandler {
  static String getErrorMessage(DioException error) {
    String errorMessage = "An unexpected error occurred";

    if (error.response != null) {
      switch (error.response?.statusCode) {
        case 400:
          errorMessage = "Bad request. Please check your input.";
          break;
        case 401:
          errorMessage = "Unauthorized. Please check your credentials.";
          break;
        case 403:
          errorMessage = "Forbidden. You don't have permission.";
          break;
        case 404:
          errorMessage = "Not found. The resource you are looking for doesn't exist.";
          break;
        case 409:
          errorMessage = error.response?.data['message'] ?? "Conflict detected.";
          break;
        case 500:
          errorMessage = "Server error. Please try again later.";
          break;
        default:
          errorMessage = error.response?.data['message'] ?? "Something went wrong.";
      }
    } else {
      errorMessage = _handleNoResponseError(error);
    }

    return errorMessage;
  }

  static String _handleNoResponseError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return "Request was cancelled";
      case DioExceptionType.connectionTimeout:
        return "Connection timeout. Please try again later.";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout. Please check your connection.";
      case DioExceptionType.sendTimeout:
        return "Send timeout. Unable to reach the server.";
      case DioExceptionType.connectionError:
        return "Connection error. Please check your internet.";
      default:
        return "Unknown error occurred.";
    }
  }
}