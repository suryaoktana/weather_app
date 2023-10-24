import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/base_url.dart';
import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../weather_detail/weather_detail.dart';

class WeatherHourlyVerticalCard extends StatelessWidget {
  final WeatherForecastItemModel weather;

  const WeatherHourlyVerticalCard({required this.weather, super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => context.read<WeatherBloc>().add(
            WeatherEvent.select(weatherModel: weather, isFromPageTwo: true)),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          buildWhen: (previous, current) =>
              previous.selectedWeather != current.selectedWeather,
          builder: (context, state) {
            final isActive = state.selectedWeather == weather;
            return Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    CustomColors.lightPurpleSecondary,
                    CustomColors.purpleSecondary
                  ]),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.white.withOpacity(isActive ? 1 : 0.4),
                      spreadRadius: isActive ? 3 : 1,
                      blurRadius: 10,
                      offset:
                          const Offset(-1, -1), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(32)),
              margin: const EdgeInsets.fromLTRB(24, 18, 24, 18),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        '${weather.main.temp}\u00B0',
                        style: CustomTextStyle.h2,
                      ),
                      getCachedNetworkImage(
                          imageUrl:
                              openWeatherImageBaseUrl(weather.weather[0].icon),
                          height: 80,
                          width: 80),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  'H:${weather.main.tempMax}\u00B0',
                                  style: CustomTextStyle.body2.copyWith(
                                      color:
                                          CustomColors.white.withOpacity(0.5)),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                CustomText(
                                  'L:${weather.main.tempMin}\u00B0',
                                  style: CustomTextStyle.body2.copyWith(
                                      color:
                                          CustomColors.white.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            CustomText(
                              'Ungaran',
                              style: CustomTextStyle.body1SemiBold,
                            ),
                          ],
                        ),
                      ),
                      CustomText(
                        weather.weather[0].main,
                        style: CustomTextStyle.body1
                            .copyWith(color: CustomColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
}
