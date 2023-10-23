import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/app_image.dart';
import '../weather_detail/weather_detail.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
        image: getJpgDecorationImage(
            imageAsset: 'starry_night', fit: BoxFit.cover)),
    child: CustomScaffold(
      body: const WeatherDetailScreen(),
      bottomNavigationBar: const BottomNavigation(),
    ),
  );
}
