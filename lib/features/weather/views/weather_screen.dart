import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/custom_scaffold.dart';
import 'package:weather_app/features/weather/weather_list/views/views.dart';
import '../../../../core/widgets/app_image.dart';
import '../weather.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            image: getJpgDecorationImage(
                imageAsset: 'starry_night', fit: BoxFit.cover)),
        child: BlocProvider(
          create: (BuildContext context) =>
              WeatherBloc(weatherRepository: WeatherRepository())
                ..add(const WeatherEvent.fetch()),
          child: const CustomScaffold(
            body: WeatherListScreen(),
            bottomNavigationBar: BottomNavigation(),
          ),
        ),
      );
}
