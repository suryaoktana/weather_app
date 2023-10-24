import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/domain/base_url.dart';
import '../../../core/utils/logging_interceptor.dart';

class WeatherApiClient {
  late final Dio _dio;
  final Duration timeOutDuration = const Duration(seconds: 60);

  WeatherApiClient() {
    _dio = _createDio(openWeatherMapBaseUrl);
  }

  Dio _createDio(String baseUrl) {
    var dio = Dio(BaseOptions(
        connectTimeout: timeOutDuration,
        sendTimeout: timeOutDuration,
        receiveTimeout: timeOutDuration,
        baseUrl: baseUrl,
        followRedirects: false,
        validateStatus: (status) {
          if (status != null && status < 300) {
            return true;
          }
          return false;
        },
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }));

    if (kDebugMode) {
      ///adding logging interceptor to log request/response
      ///in every api call
      dio.interceptors.add(LoggingInterceptor());
    }
    return dio;
  }

  Future<Response> post(
          {required String endpoint,
          required String payload,
          Map<String, dynamic>? queryParameters}) async =>
      _dio.post(endpoint, data: payload, queryParameters: queryParameters);

  Future<Response> get(
          {required String endpoint,
          Map<String, dynamic>? queryParameters}) async =>
      _dio.get(endpoint, queryParameters: queryParameters);
}
