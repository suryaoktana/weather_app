part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default([]) List<WeatherModel> weathers,
    WeatherModel? selectedWeather,
  }) = _WeatherState;
}