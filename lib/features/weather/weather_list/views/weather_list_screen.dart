import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/weather.dart';

class WeatherListScreen extends StatelessWidget {
  static const String route = '/weather_list_screen';

  const WeatherListScreen({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: double.infinity,
        child: ContainerWithFrostedGlass(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [],
        )),
      );

  static Future<void> open(BuildContext context) async =>
      Navigator.pushNamed(context, route);
}
