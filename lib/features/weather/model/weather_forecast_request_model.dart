import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_forecast_request_model.freezed.dart';
part 'weather_forecast_request_model.g.dart';

@freezed
class WeatherForecastRequestModel with _$WeatherForecastRequestModel {
  const factory WeatherForecastRequestModel({
    required String lat,
    required String lon,
    required String appid,
    @Default('metric') String units,
  }) = _WeatherForecastRequestModel;

  factory WeatherForecastRequestModel.fromJson(Map<String, Object?> json) =>
      _$WeatherForecastRequestModelFromJson(json);
}
