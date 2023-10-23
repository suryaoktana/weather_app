part of 'weather_list_bloc.dart';

@freezed
class WeatherListEvent with _$WeatherListEvent {
  const factory WeatherListEvent.fetch({
    @Default('') String param,
  }) = _FetchWeatherListEvent;
}
