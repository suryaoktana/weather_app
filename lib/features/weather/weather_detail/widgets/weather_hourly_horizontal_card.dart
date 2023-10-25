import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/base_url.dart';
import '../../../../core/style/custom_colors.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../weather_detail/weather_detail.dart';

class WeatherHourlyHorizontalCard extends StatelessWidget {
  final WeatherForecastItemModel weather;

  const WeatherHourlyHorizontalCard({required this.weather, super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => context
            .read<WeatherBloc>()
            .add(WeatherEvent.select(weatherModel: weather)),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          buildWhen: (previous, current) =>
              previous.selectedWeather != current.selectedWeather,
          builder: (context, state) {
            final isActive = state.selectedWeather == weather;
            return Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    CustomColors.purpleSecondary,
                    CustomColors.lightPurpleSecondary
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
                  borderRadius: BorderRadius.circular(60)),
              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 2),
              width: 76,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    formatDateTimeToDay(weather.dtTxt),
                    style: CustomTextStyle.body2SemiBold,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  CustomText(
                    formatDateTimeToHourMinutes(weather.dtTxt),
                    style: CustomTextStyle.body1SemiBold,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: getCachedNetworkImage(
                        imageUrl:
                            openWeatherImageBaseUrl(weather.weather[0].icon),
                        height: 62,
                        width: 62),
                  ),
                  CustomText(
                    weather.weather[0].main,
                    style: CustomTextStyle.body2SemiBold
                        .copyWith(color: CustomColors.white.withOpacity(0.6)),
                  ),
                  CustomText(
                    '${weather.main.temp.ceil()}\u00B0',
                    style: CustomTextStyle.h4,
                  ),
                ],
              ),
            );
          },
        ),
      );
}
