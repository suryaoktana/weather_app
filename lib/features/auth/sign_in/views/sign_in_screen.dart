import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/base_response.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../weather/weather.dart';
import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/background_container.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../auth.dart';
import '../../sign_up/views/sign_up_screen.dart';
import '../sign_in.dart';

class SignInScreen extends StatelessWidget {
  static const String route = '/sign_in';

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) => BackgroundContainer(
        child: ContainerWithFrostedGlass(
          child: CustomScaffold(
            body: BlocProvider(
              create: (_) => SignInBloc(),
              child: Center(
                child: BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) =>
                      previous.signInState != current.signInState,
                  builder: (context, state) {
                    if (state.signInState.state == ResponseState.loading) {
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
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 14,
          ),
          const SignInEmailTextField(),
          const SizedBox(
            height: 25,
          ),
          const SignInPasswordTextField(),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () async => SignUpScreen.open(context),
            child: CustomText("Don't have an Account? Sign Up here",
                style: CustomTextStyle.lightTypographyBody2
                    .copyWith(color: CustomColors.white)),
          ),
          const SizedBox(
            height: 48,
          ),
          BlocBuilder<SignInBloc, SignInState>(
            buildWhen: (previous, current) =>
                previous.email != current.email ||
                previous.password != current.password,
            builder: (context, state) => PrimaryButton(
              label: 'Sign In',
              onTap: () => context.read<AuthBloc>().add(
                  AuthEvent.signInSubmitted(
                      email: state.email, password: state.password)),
            ),
          )
        ],
      );

  static Future<void> open(BuildContext context) async =>
      Navigator.of(context).pushNamed(route);
}
