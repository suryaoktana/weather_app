import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/const/weather_api_key.dart';
import '../../../core/models/base_response.dart';
import '../weather.dart';

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
        select: (event) async => await _onSelectWeather(event, emit),
      );
    });
  }

  final WeatherRepository _weatherRepository;

  _onFetch(_FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    var response = await _weatherRepository.getWeatherForecasts(
        const WeatherForecastRequestModel(
            lat: '0', lon: '0', appid: weatherApiKey));

    if (response.state == ResponseState.success) {
      emit(state.copyWith(
        weathers: response,
        selectedWeather: response.data!.isNotEmpty ? response.data![0] : null,
      ));
    } else {
      emit(state.copyWith(
        weathers: response,
      ));
    }
  }

  _onSelectWeather(_SelectWeatherEvent event, Emitter<WeatherState> emit) {
    if (event.isFromPageTwo) {
      emit(state.copyWith(tabSelected: 1));
    }
    emit(state.copyWith(selectedWeather: event.weatherModel, tabSelected: 0));
  }
}
