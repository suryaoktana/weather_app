import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../weather/weather.dart';
import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/background_container.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../sign_up/views/sign_up_screen.dart';
import '../sign_in.dart';

class SignInScreen extends StatelessWidget {
  static const String route = '/sign_in';

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) => BackgroundContainer(
        child: ContainerWithFrostedGlass(
          child: CustomScaffold(
            body: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        'Sign In',
                        style: CustomTextStyle.h3
                            .copyWith(color: CustomColors.white),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      CustomText('Welcome back to Weather App!',
                          style: CustomTextStyle.body2SemiBold
                              .copyWith(color: CustomColors.white)),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  SignInEmailTextField(),
                  const SizedBox(
                    height: 25,
                  ),
                  SignInPasswordTextField(),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () async => SignUpScreen.open(context),
                    child: CustomText('Dont have an Account? Sign Up here',
                        style: CustomTextStyle.lightTypographyBody2
                            .copyWith(color: CustomColors.white)),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  PrimaryButton(
                    label: 'Sign In',
                    onTap: () async => WeatherScreen.open(context),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  static Future<void> open(BuildContext context) async =>
      Navigator.of(context).pushNamed(route);
}
