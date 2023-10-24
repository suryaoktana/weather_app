import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/const/base_url.dart';
import '../../../../core/style/custom_colors.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../weather_detail.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 8.5),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          buildWhen: (previous, current) =>
              previous.selectedWeather != current.selectedWeather,
          builder: (context, state) {
            if (state.selectedWeather != null) {
              return _contentInfo(
                  weather: state.selectedWeather!,
                  locationName: state.locationName);
            } else {
              return _loadingShimmer;
            }
          },
        ),
      );

  Widget get _loadingShimmer => const Column(
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
      );

  Widget _contentInfo(
          {required WeatherForecastItemModel weather,
          required String locationName}) =>
      Column(
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
            formatDateTimeAsString(weather.dtTxt,
                dateFormat: 'EEEE, MMMM dd, yyyy'),
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
                  padding: const EdgeInsets.only(top: 1.0),
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
}
