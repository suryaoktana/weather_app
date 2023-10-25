import 'package:flutter/material.dart';
import '../weather_detail.dart';

class WeatherDetailScreen extends StatelessWidget {
  const WeatherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) =>   Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: Container(
              color:Colors.green,
              child: WeatherInfo())),
          Flexible(child: WeatherHourlyForecasts()),
        ],
      );
}
