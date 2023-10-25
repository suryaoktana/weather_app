import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/base_response.dart';
import '../../../../core/widgets/container_with_frosted_glass.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../../../../core/widgets/custom_text.dart';
import '../weather_detail.dart';

class WeatherHourlyForecasts extends StatelessWidget {
  const WeatherHourlyForecasts({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 50,
            child: ContainerWithFrostedGlass(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(48), topRight: Radius.circular(48)),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: CustomText(
                    'Hourly Forecast',
                    style: CustomTextStyle.body2,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            margin: const EdgeInsets.only(top: 4),
            child: ContainerWithFrostedGlass(
              childPadding: EdgeInsets.zero,
              child: BlocBuilder<WeatherBloc, WeatherState>(
                  buildWhen: (previous, current) =>
                      previous.weathers.state != current.weathers.state,
                  builder: (context, state) {
                    if (state.weathers.state == ResponseState.success) {
                      return _weathers(state.weathers.data!);
                    } else {
                      return _loading;
                    }
                  }),
            ),
          ),
        ],
      );

  Widget _weathers(List<WeatherForecastItemModel> weathers) => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weathers.length,
        itemBuilder: (BuildContext context, int index) =>
            WeatherHourlyHorizontalCard(weather: weathers[index]),
      );

  Widget get _loading => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          child: const ShimmerWidget(
            radius: 60,
            height: 100,
            width: 76,
          ),
        ),
      );
}
