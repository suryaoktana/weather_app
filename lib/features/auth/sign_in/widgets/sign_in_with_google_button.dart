import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../auth.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) => PrimaryButton(
        buttonPrimaryType: ButtonPrimaryType.solidWhite,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            getPngImage('google_icon', height: 30, width: 30),
            const SizedBox(
              width: 6,
            ),
            CustomText(
              'Continue with Google',
              style: CustomTextStyle.body1SemiBold
                  .copyWith(color: CustomColors.black),
            )
          ],
        ),
        onTap: () =>
            context.read<AuthBloc>().add(const AuthEvent.googleSignIn()),
      );
}
