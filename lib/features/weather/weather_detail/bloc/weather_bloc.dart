import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../weather_detail.dart';

part 'weather_event.dart';

part 'weather_state.dart';

part 'weather_bloc.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(const WeatherState()) {
    on<WeatherEvent>((events, emit) async {
      await events.map(
          fetch: (event) async => await _onFetch(event, emit),
          select: (event) async => await _onSelectWeather(event, emit));
    });
  }

  final WeatherRepository _weatherRepository;

  _onFetch(_FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      weathers: weathers,
      selectedWeather: weathers[0],
    ));
  }

  _onSelectWeather(_SelectWeatherEvent event, Emitter<WeatherState> emit) {
    emit(state.copyWith(
      selectedWeather: event.weatherModel,
    ));
  }
}
