import 'package:flutter/material.dart';

import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/custom_text.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            'Sign Up',
            style: CustomTextStyle.h3.copyWith(color: CustomColors.white),
          ),
          const SizedBox(
            height: 13,
          ),
          CustomText('We hope you will enjoy using our App!',
              style: CustomTextStyle.body2SemiBold
                  .copyWith(color: CustomColors.white)),
        ],
      );
}
