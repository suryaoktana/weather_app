import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/base_response.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../auth.dart';
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
            body: BlocProvider(
              create: (_) => SignUpBloc(),
              child: Center(
                child: BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) =>
                      previous.signUpState.state != current.signUpState.state,
                  builder: (context, state) {
                    if (state.signUpState.state == ResponseState.loading) {
                      return const CircularProgressIndicator();
                    } else {
                      return _form(context);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      );

  Widget _form(BuildContext context) => ListView(
        shrinkWrap: true,
        children: [
          Column(
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
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 14,
          ),
          const SignUpEmailTextField(),
          const SizedBox(
            height: 25,
          ),
          const SignUpPasswordTextField(),
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
          BlocBuilder<SignUpBloc, SignUpState>(
            buildWhen: (previous, current) =>
                previous.email != current.email ||
                previous.password != current.password,
            builder: (context, state) => PrimaryButton(
              label: 'Sign Up',
              onTap: () => context.read<AuthBloc>().add(
                  AuthEvent.signUpSubmitted(
                      email: state.email, password: state.password)),
            ),
          )
        ],
      );

  static Future<void> open(BuildContext context) async =>
      Navigator.of(context).pushNamed(route);
}
