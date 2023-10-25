import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/const/base_url.dart';
import '../../../../core/models/base_response.dart';
import '../../../../core/style/custom_colors.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../weather_detail.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              padding: constraints.maxHeight < 100
                  ? EdgeInsets.zero
                  : EdgeInsets.only(top: constraints.maxHeight / 12),
              child: SingleChildScrollView(
                child: Container(
                  constraints: const BoxConstraints(minHeight: 350),
                  child: BlocBuilder<WeatherBloc, WeatherState>(
                    buildWhen: (previous, current) =>
                        previous.weathers.state != current.weathers.state ||
                        previous.selectedWeather != current.selectedWeather,
                    builder: (context, state) {
                      if (state.weathers.state == ResponseState.success) {
                        return _contentInfo(
                            weather: state.selectedWeather!,
                            locationName: state.locationName);
                      } else {
                        return _loadingShimmer;
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _contentInfo(
          {required WeatherForecastItemModel weather,
          required String locationName}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            locationName,
            style: CustomTextStyle.h3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomText(
            formatDateTimeAsString(weather.dtTxt, dateFormat: 'EEEE'),
            style: CustomTextStyle.lightTypographyBody1SemiBold,
          ),
          const SizedBox(
            height: 2,
          ),
          CustomText(
            formatDateTimeAsString(weather.dtTxt,
                dateFormat: 'MMMM dd, yyyy, h a'),
            style: CustomTextStyle.lightTypographyBody1SemiBold,
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            width: 200,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CustomText(
                    '${weather.main.temp.ceil()}\u00B0',
                    style: CustomTextStyle.h1,
                  ),
                ),
                Positioned(
                  right: -12,
                  bottom: -16,
                  child: getCachedNetworkImage(
                      imageUrl:
                          openWeatherImageBaseUrl(weather.weather[0].icon),
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                'H:${weather.main.tempMax.ceil()}\u00B0',
                style: CustomTextStyle.body1SemiBold,
              ),
              const SizedBox(
                width: 8,
              ),
              CustomText(
                'L:${weather.main.tempMin.ceil()}\u00B0',
                style: CustomTextStyle.body1SemiBold,
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                weather.weather[0].main,
                style: CustomTextStyle.h5
                    .copyWith(color: CustomColors.white.withOpacity(0.5)),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.5),
                  child: CustomText(
                    weather.weather[0].description,
                    style: CustomTextStyle.body2,
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  Widget get _loadingShimmer => const Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShimmerWidget(
              width: 140,
              height: 40,
            ),
            SizedBox(
              height: 8,
            ),
            ShimmerWidget(
              width: 160,
              height: 30,
            ),
            SizedBox(
              height: 12,
            ),
            ShimmerWidget(
              width: 160,
              height: 80,
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShimmerWidget(
                  width: 60,
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
        ),
      );
}
