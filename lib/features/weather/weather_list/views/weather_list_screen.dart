import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/style/custom_values.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../weather.dart';
import '../weather_list.dart';

import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/shimmer_widget.dart';

class WeatherListScreen extends StatelessWidget {
  const WeatherListScreen({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_title, _content],
        ),
      );

  Widget get _content => Expanded(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state.weathers.isNotEmpty) {
              return _weathers(state.weathers);
            } else {
              return _loading;
            }
          },
        ),
      );

  Widget _weathers(List<WeatherModel> weathers) => ShaderMask(
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
              WeatherHourlyVerticalCard(weatherModel: weathers[index]),
          itemCount: weathers.length,
        ),
      );

  Widget get _title => SafeArea(
          child: Padding(
        padding: CustomValues.padding.copyWith(top: 16, bottom: 4),
        child: CustomText(
          'Weather',
          style: CustomTextStyle.h3
              .copyWith(fontWeight: CustomFontWeight.bold.value),
        ),
      ));

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
