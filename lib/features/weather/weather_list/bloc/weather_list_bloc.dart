import 'package:flutter_bloc/flutter_bloc.dart';
import '../weather_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_list_event.dart';

part 'weather_list_state.dart';

part 'weather_list_bloc.freezed.dart';

class WeatherListBloc extends Bloc<WeatherListEvent, WeatherListState> {
  WeatherListBloc({required WeatherListRepository weatherListRepository})
      : _weatherListRepository = weatherListRepository,
        super(const WeatherListState()) {
    on<WeatherListEvent>((events, emit) async {
      await events.map(
        fetch: (event) async => await _onFetch(event, emit),
      );
    });
  }

  final WeatherListRepository _weatherListRepository;

  _onFetch(WeatherListEvent event, Emitter<WeatherListState> emit) async {
    emit(state.copyWith(
      statePlaceholder: 'placeholder',
    ));
  }
}
