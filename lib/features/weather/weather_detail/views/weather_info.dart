import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../weather_detail.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 80),
        child: BlocBuilder<WeatherBloc, WeatherState>(
            buildWhen: (previous, current) =>
                previous.selectedWeather != current.selectedWeather,
            builder: (context, state) {
              if (state.selectedWeather != null) {
                return _contentInfo(state.selectedWeather!);
              } else {
                return _loadingShimmer;
              }
            }),
      );

  Widget get _loadingShimmer => const Column(
        children: [
          ShimmerWidget(
            width: 140,
            height: 40,
          ),
          SizedBox(
            height: 6,
          ),
          ShimmerWidget(
            width: 140,
            height: 80,
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShimmerWidget(
                width: 80,
                height: 50,
              ),
              SizedBox(
                width: 6,
              ),
              ShimmerWidget(
                width: 60,
                height: 50,
              ),
            ],
          ),
        ],
      );

  Widget _contentInfo(WeatherModel weatherModel) => Column(
        children: [
          CustomText(
            'Ungaran',
            style: CustomTextStyle.h3,
          ),
          CustomText(
            '${weatherModel.temperature}\u00B0',
            style: CustomTextStyle.h1,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      weatherModel.weatherType.name,
                      style: CustomTextStyle.h7
                          .copyWith(color: CustomColors.white.withOpacity(0.5)),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          'H:${weatherModel.temperature}\u00B0',
                          style: CustomTextStyle.body1SemiBold,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomText(
                          'L:${weatherModel.temperature}\u00B0',
                          style: CustomTextStyle.body1SemiBold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              getPngImage(weatherModel.weatherType.imageAsset,
                  height: 50, width: 50),
            ],
          ),
        ],
      );
}
