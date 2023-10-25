import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../weather.dart';

class WeatherTypeDropdown extends StatelessWidget {
  const WeatherTypeDropdown({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<WeatherBloc, WeatherState>(
        buildWhen: (previous, current) =>
            previous.weatherType != current.weatherType,
        builder: (context, state) => DropdownButton<WeatherType>(
            borderRadius: BorderRadius.circular(12),
            underline: const SizedBox.shrink(),
            dropdownColor: CustomColors.purpleSecondary,
            style: CustomTextStyle.body2,
            iconEnabledColor: CustomColors.white,
            value: state.weatherType,
            items: WeatherType.values
                .map((e) => DropdownMenuItem<WeatherType>(
                    value: e, child: CustomText(e.description)))
                .toList(),
            onChanged: (value) => context.read<WeatherBloc>().add(
                WeatherEvent.selectWeatherType(
                    weatherType: value ?? WeatherType.metric))),
      );
}
