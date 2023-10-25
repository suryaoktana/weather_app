import 'package:flutter/material.dart';

import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../sign_in/sign_in.dart';

class SignInTextButton extends StatelessWidget {
  const SignInTextButton({super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () async => SignInScreen.open(context),
        child: CustomText('Already have an Account? Sign In here',
            style: CustomTextStyle.lightTypographyBody2
                .copyWith(color: CustomColors.white)),
      );
}
