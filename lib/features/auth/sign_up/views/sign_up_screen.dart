import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../sign_in/sign_in.dart';
import '../../../weather/weather.dart';
import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/background_container.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../sign_up.dart';

class SignUpScreen extends StatelessWidget {
  static const String route = '/sign_up';

  const SignUpScreen({super.key});

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
                        'Sign Up',
                        style: CustomTextStyle.h3
                            .copyWith(color: CustomColors.white),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      CustomText('We hope you will enjoy using our App!',
                          style: CustomTextStyle.body2SemiBold
                              .copyWith(color: CustomColors.white)),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  SignUpEmailTextField(),
                  const SizedBox(
                    height: 25,
                  ),
                  SignUpPasswordTextField(),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () async => SignInScreen.open(context),
                    child: CustomText('Already have an Account? Sign In here',
                        style: CustomTextStyle.lightTypographyBody2
                            .copyWith(color: CustomColors.white)),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  PrimaryButton(
                    label: 'Sign Up',
                    onTap: () {},
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
