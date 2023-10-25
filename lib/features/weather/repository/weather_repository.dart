import 'package:dio/dio.dart';

import '../../../core/const/endpoint.dart';
import '../../../core/models/base_response.dart';
import '../domain/weather_api_client.dart';
import '../weather.dart';

class WeatherRepository {
  Future<BaseResponse<List<WeatherForecastItemModel>>> getWeatherForecasts(
      {required double latitude,
      required double longitude,
      required String units}) async {
    try {
      Response response = await WeatherApiClient().get(
          endpoint: forecastsEndpoint,
          queryParameters: WeatherForecastRequestModel(
                  lat: latitude.toString(),
                  lon: longitude.toString(),
                  units: units)
              .toJson());
      return BaseResponse.complete(
          data: WeatherForecastResponseModel.fromJson(response.data).list);
    } catch (e) {
      return BaseResponse.error();
    }
  }
}
