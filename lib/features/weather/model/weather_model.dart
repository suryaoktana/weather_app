import 'package:equatable/equatable.dart';

enum WeatherType {
  sunny('sunny'),
  cloudy('cloudy'),
  rainy('rainy'),
  windy('windy');

  final String imageAsset;

  const WeatherType(this.imageAsset);
}

class WeatherModel extends Equatable {
  final String time;
  final WeatherType weatherType;
  final int temperature;

  const WeatherModel(
      {required this.time,
      required this.weatherType,
      required this.temperature});

  @override
  List<Object?> get props => [time, weatherType, temperature];
}

const List<WeatherModel> weathers = [
  WeatherModel(time: '12 PM', weatherType: WeatherType.cloudy, temperature: 19),
  WeatherModel(time: 'Now', weatherType: WeatherType.sunny, temperature: 20),
  WeatherModel(time: '2 PM', weatherType: WeatherType.rainy, temperature: 17),
  WeatherModel(time: '4 PM', weatherType: WeatherType.windy, temperature: 18),
  WeatherModel(time: '6 PM', weatherType: WeatherType.rainy, temperature: 17),
  WeatherModel(time: '8 PM', weatherType: WeatherType.rainy, temperature: 16),
];
