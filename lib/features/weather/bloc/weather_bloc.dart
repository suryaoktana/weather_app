import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
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
        initiateLocationServices: (event) async =>
            await _onInitiateLocationServices(event, emit),
      );
    });
  }

  final WeatherRepository _weatherRepository;

  _onFetch(_FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    ///get user current location
    final Position position = await _getCurrentPosition;
    final Placemark? placeMark = await getPlaceMark(position);

    if (placeMark != null) {
      emit(state.copyWith(locationName: _getFinestLocationName(placeMark)));
    }

    var response = await _weatherRepository.getWeatherForecasts(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    if (response.state == ResponseState.success) {
      emit(
        state.copyWith(
            weathers: response,
            selectedWeather:
                response.data!.isNotEmpty ? response.data![0] : null),
      );
    } else {
      emit(
        state.copyWith(
          weathers: response,
        ),
      );
    }
  }

  String _getFinestLocationName(Placemark placeMark) =>

      ///set locationName based on finest location available
      placeMark.subLocality ??
      placeMark.locality ??
      placeMark.administrativeArea ??
      placeMark.country ??
      '';

  Future<Placemark?> getPlaceMark(Position position) async {
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placeMarks.isNotEmpty) {
      return placeMarks[0];
    } else {
      return null;
    }
  }

  Future<Position> get _getCurrentPosition async =>
      await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

  _onSelectWeather(_SelectWeatherEvent event, Emitter<WeatherState> emit) {
    if (event.isFromPageTwo) {
      emit(state.copyWith(tabSelected: 1));
    }
    emit(state.copyWith(selectedWeather: event.weatherModel, tabSelected: 0));
  }

  _onInitiateLocationServices(_InitiateLocationServicesWeatherEvent event,
      Emitter<WeatherState> emit) async {
    late LocationPermission permission;

    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(state.copyWith(
          isLocationServiceEnabledState: BaseResponse.error(
              message:
                  'Location services are disabled. Please enable the services')));
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(state.copyWith(
            isLocationServiceEnabledState: BaseResponse.error(
                message: 'Location permissions are denied')));
      }
    }
    if (permission == LocationPermission.deniedForever) {
      emit(state.copyWith(
          isLocationServiceEnabledState: BaseResponse.error(
              message:
                  'Location permissions are permanently denied, we cannot request permissions.')));
    }
    if ((permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse) &&
        serviceEnabled) {
      add(const WeatherEvent.fetch());
    }
  }
}
