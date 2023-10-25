import 'package:flutter/material.dart';
import '../weather_list.dart';

class WeatherListScreen extends StatelessWidget {
  const WeatherListScreen({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeatherListHeader(),
            WeatherListContent(),
          ],
        ),
      );
}
