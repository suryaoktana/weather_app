import 'package:dio/dio.dart';

import '../../../core/domain/endpoint.dart';
import '../../../core/models/base_response.dart';
import '../domain/weather_api_client.dart';
import '../model/weather_forecast_request_model.dart';
import '../model/weather_forecast_response_model.dart';

class WeatherRepository {
  static Future<BaseResponse<WeatherForecastResponseModel>> getWeatherForecasts(
      WeatherForecastRequestModel weatherForecastRequestModel) async {
    try {
      Response response = await WeatherApiClient().get(
          endpoint: forecastsEndpoint,
          queryParameters: weatherForecastRequestModel.toJson());
      return BaseResponse.complete(
          data: WeatherForecastResponseModel.fromJson(response.data));
    } catch (_) {
      return BaseResponse.error();
    }
  }
}
