import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_forecast_response_model.freezed.dart';

part 'weather_forecast_response_model.g.dart';

@freezed
class WeatherForecastResponseModel with _$WeatherForecastResponseModel {
  const factory WeatherForecastResponseModel({
    required String cod,
    required int message,
    required int cnt,
    required List<WeatherForecastItemModel> list,
  }) = _WeatherForecastResponseModel;

  factory WeatherForecastResponseModel.fromJson(Map<String, Object?> json) =>
      _$WeatherForecastResponseModelFromJson(json);
}

@freezed
class WeatherForecastItemModel with _$WeatherForecastItemModel {
  const factory WeatherForecastItemModel({
    required int dt,
    required MainModel main,
    required List<WeatherModel> weather,
    @JsonKey(name: 'dt_txt') required String dtTxt,
  }) = _WeatherForecastItemModel;

  factory WeatherForecastItemModel.fromJson(Map<String, Object?> json) =>
      _$WeatherForecastItemModelFromJson(json);
}

@freezed
class MainModel with _$MainModel {
  const factory MainModel({
    required double temp,
    @JsonKey(name: 'feels_like') required double feelsLike,
    @JsonKey(name: 'temp_max') required double tempMax,
    @JsonKey(name: 'temp_min') required double tempMin,
  }) = _MainModel;

  factory MainModel.fromJson(Map<String, Object?> json) =>
      _$MainModelFromJson(json);
}

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, Object?> json) =>
      _$WeatherModelFromJson(json);
}
