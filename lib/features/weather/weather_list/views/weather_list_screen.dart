import 'package:flutter/material.dart';

class WeatherListScreen extends StatelessWidget {
  static const String route = '/weather_list_screen';

  const WeatherListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static Future<void> open(BuildContext context) async =>
      Navigator.pushNamed(context, route);
}
