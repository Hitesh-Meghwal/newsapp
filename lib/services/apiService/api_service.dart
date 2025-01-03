import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:newsapp/models/apiResponse_model.dart';
import 'package:newsapp/services/apiService/dioerrorHandler.dart';
import 'package:newsapp/services/apiService/injection_container.dart';

class Apiservice {
  Dio dio = getDio();
  var logger = Logger();

  // Custom headers, like the authorization token
  Map<String, dynamic> headers = {"Authorization": 'Bearer token'};

  // GET API
  Future<ApiresponseModel?> get({
    required String url,
    bool isAuthRequired = false,
  }) async {
    // If authorization is required, add custom headers
    if (isAuthRequired) {
      dio.options.headers.addAll(headers);
    }
    try {
      Response response = await dio.get(url);
      return ApiresponseModel.fromJson(response.data);
    } on DioException catch (e) {
      String errorMsg = DioErrorHandler.getErrorMessage(e);
      logger.e("GET request error: $errorMsg");
      return null;
    }
  }

  // POST API
  Future<ApiresponseModel?> post({
    required String url,
    Object? requestBody,
    bool isAuthRequired = false,
  }) async {
    // If authorization is required, add custom headers
    if (isAuthRequired) {
      dio.options.headers.addAll(headers);
    }
    try {
      Response response;
      if (requestBody == null) {
        response = await dio.post(url);
      } else {
        response = await dio.post(url, data: requestBody);
      }
      return ApiresponseModel.fromJson(response.data);
    } on DioException catch (e) {
      String errorMsg = DioErrorHandler.getErrorMessage(e);
      logger.e("POST request error: $errorMsg");
      return null;
    }
  }
}
