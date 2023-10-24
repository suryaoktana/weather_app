import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/const/weather_api_key.dart';

part 'weather_forecast_request_model.freezed.dart';

part 'weather_forecast_request_model.g.dart';

@freezed
class WeatherForecastRequestModel with _$WeatherForecastRequestModel {
  const factory WeatherForecastRequestModel({
    required String lat,
    required String lon,
    @Default(weatherApiKey) @JsonKey(name: 'appid') String appId,
    @Default('metric') String units,
  }) = _WeatherForecastRequestModel;

  factory WeatherForecastRequestModel.fromJson(Map<String, Object?> json) =>
      _$WeatherForecastRequestModelFromJson(json);
}
