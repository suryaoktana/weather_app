part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(BaseResponse())
    BaseResponse<List<WeatherForecastItemModel>> weathers,
    WeatherForecastItemModel? selectedWeather,
    @Default(0) int tabSelected,
    @Default(BaseResponse()) BaseResponse<bool> isLocationServiceEnabledState,
    @Default('') String locationName,
  }) = _WeatherState;
}
