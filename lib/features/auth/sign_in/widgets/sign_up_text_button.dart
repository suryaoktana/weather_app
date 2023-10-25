import 'package:flutter/material.dart';

import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../sign_up/views/sign_up_screen.dart';

class SignUpTextButton extends StatelessWidget {
  const SignUpTextButton({super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () async => SignUpScreen.open(context),
        child: CustomText("Don't have an Account? Sign Up here",
            style: CustomTextStyle.lightTypographyBody2
                .copyWith(color: CustomColors.white)),
      );
}
