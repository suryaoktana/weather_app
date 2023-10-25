import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/custom_values.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../auth/auth.dart';

class WeatherListHeader extends StatelessWidget {
  const WeatherListHeader({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Padding(
        padding: CustomValues.padding.copyWith(top: 16, bottom: 4),
        child: Row(
          children: [
            Expanded(
              child: CustomText(
                'Weather',
                style: CustomTextStyle.h3
                    .copyWith(fontWeight: CustomFontWeight.bold.value),
              ),
            ),
            InkWell(
                onTap: () => context
                    .read<AuthBloc>()
                    .add(const AuthEvent.signOutSubmitted()),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
      ));
}
