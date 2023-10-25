import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/base_response.dart';
import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../../weather.dart';
import '../weather_list.dart';

class WeatherListContent extends StatelessWidget {
  const WeatherListContent({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          buildWhen: (previous, current) =>
              previous.weathers.state != current.weathers.state,
          builder: (context, state) {
            if (state.weathers.state == ResponseState.success) {
              return _weathers(state.weathers.data!);
            } else {
              return _loading;
            }
          },
        ),
      );

  Widget _weathers(List<WeatherForecastItemModel> weathers) => ShaderMask(
        shaderCallback: (rect) => const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [CustomColors.black, Colors.transparent],
          stops: [0.0, 0.10],
        ).createShader(rect),
        blendMode: BlendMode.dstOut,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 14),
          itemBuilder: (context, index) =>
              WeatherHourlyVerticalCard(weather: weathers[index]),
          itemCount: weathers.length,
        ),
      );

  Widget get _loading => ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => Container(
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 36),
          child: const ShimmerWidget(
            radius: 32,
            height: 172,
            width: double.infinity,
          ),
        ),
      );
}
