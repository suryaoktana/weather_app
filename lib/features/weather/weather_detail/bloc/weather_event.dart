part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.fetch({
    @Default('') String param,
  }) = _FetchWeatherEvent;

  const factory WeatherEvent.select({
    required WeatherModel weatherModel,
  }) = _SelectWeatherEvent;
}
