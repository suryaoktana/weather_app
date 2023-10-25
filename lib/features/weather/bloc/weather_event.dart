part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.fetch() = _FetchWeatherEvent;

  const factory WeatherEvent.select({
    @Default(false) bool isFromPageTwo,
    required WeatherForecastItemModel weatherModel,
  }) = _SelectWeatherEvent;

  const factory WeatherEvent.selectWeatherType({
    required WeatherType weatherType,
  }) = _SelectWeatherTypeEvent;

  const factory WeatherEvent.initiateLocationServices() =
      _InitiateLocationServicesWeatherEvent;
}
