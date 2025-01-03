import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Dio getDio() {
  Dio dio = Dio();
  var logger = Logger();

  dio.options = BaseOptions(
    contentType: "application/json",
    receiveDataWhenStatusError:
        true, // Allows data to be received even when there's an error status
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 30),
    // validateStatus: (status) {
    //   // Accept any status codes between 200 and 409 (inclusive) so that 409 is not treated as an error
    //   return status != null && status >= 200 && status <= 409;
    // },
  );

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      logger.i("API URL: ${options.uri}");
      logger.i("HEADER: ${options.headers}");
      logger.i("REQUEST BODY: ${jsonEncode(options.data)}");
      return handler.next(
          options); // Continue to the next interceptor or send the request
    },
    onResponse: (response, handler) {
      logger.d("API RESPONSE: ${response.data}");
      return handler.next(
          response); // Continue to the next interceptor or return the response
    },
    onError: (error, handler) {
      logger.e("STATUS CODE: ${error.response?.statusCode}");
      logger.e("ERROR DATA: ${error.response?.data}");
      return handler.next(error); // Continue to handle the error
    },
  ));

  return dio;
}