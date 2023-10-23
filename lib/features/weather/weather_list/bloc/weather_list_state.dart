part of 'weather_list_bloc.dart';

@freezed
class WeatherListState with _$WeatherListState {
  const factory WeatherListState({@Default('') String statePlaceholder}) =
      _WeatherListState;
}
