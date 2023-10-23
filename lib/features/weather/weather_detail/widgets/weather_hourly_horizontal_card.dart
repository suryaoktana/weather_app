import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../weather_detail/weather_detail.dart';

class WeatherHourlyHorizontalCard extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherHourlyHorizontalCard({required this.weatherModel, super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => context
            .read<WeatherBloc>()
            .add(WeatherEvent.select(weatherModel: weatherModel)),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          buildWhen: (previous, current) =>
              previous.selectedWeather != current.selectedWeather,
          builder: (context, state) {
            final isActive = state.selectedWeather == weatherModel;
            return Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [CustomColors.purple, CustomColors.lightPurple]),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.white.withOpacity(isActive ? 1 : 0.4),
                      spreadRadius: isActive ? 3 : 1,
                      blurRadius: 10,
                      offset:
                          const Offset(-1, -1), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(60)),
              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 2),
              width: 76,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    weatherModel.time,
                    style: CustomTextStyle.body1SemiBold,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: getPngImage(weatherModel.weatherType.imageAsset,
                        height: 40, width: 40),
                  ),
                  CustomText(
                    '${weatherModel.temperature}\u00B0',
                    style: CustomTextStyle.h6,
                  ),
                ],
              ),
            );
          },
        ),
      );
}
