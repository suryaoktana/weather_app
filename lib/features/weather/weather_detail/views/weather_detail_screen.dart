import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/app_image.dart';
import '../weather_detail.dart';

class WeatherDetailScreen extends StatelessWidget {
  const WeatherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) =>
            WeatherBloc(weatherRepository: WeatherRepository())
              ..add(const WeatherEvent.fetch()),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherInfo(),
            WeatherHourlyForecasts(),
          ],
        ),
      );
}
