import 'package:dio/dio.dart';

import '../../../core/const/endpoint.dart';
import '../../../core/models/base_response.dart';
import '../domain/weather_api_client.dart';
import '../weather.dart';

class WeatherRepository {
  Future<BaseResponse<List<WeatherForecastItemModel>>> getWeatherForecasts(
      WeatherForecastRequestModel weatherForecastRequestModel) async {
    try {
      Response response = await WeatherApiClient().get(
          endpoint: forecastsEndpoint,
          queryParameters: weatherForecastRequestModel.toJson());
      return BaseResponse.complete(
          data: WeatherForecastResponseModel.fromJson(response.data).list);
    } catch (e) {
      return BaseResponse.error();
    }
  }
}
