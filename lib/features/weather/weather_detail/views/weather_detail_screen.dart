import 'package:flutter/material.dart';
import '../weather_detail.dart';

class WeatherDetailScreen extends StatelessWidget {
  const WeatherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) => const Stack(
        children: [WeatherInfo(), WeatherForecastOverlay()],
      );
}
