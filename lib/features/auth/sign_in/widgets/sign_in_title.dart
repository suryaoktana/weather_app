import 'package:flutter/material.dart';

import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/custom_text.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            'Sign In',
            style: CustomTextStyle.h3.copyWith(color: CustomColors.white),
          ),
          const SizedBox(
            height: 13,
          ),
          CustomText('Welcome back to Weather App!',
              style: CustomTextStyle.body2SemiBold
                  .copyWith(color: CustomColors.white)),
        ],
      );
}
