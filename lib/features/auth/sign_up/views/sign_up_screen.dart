import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/base_response.dart';
import '../../../../core/style/custom_colors.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/widgets/container_with_frosted_glass.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../weather/weather.dart';
import '../../auth.dart';
import '../../../../core/widgets/background_container.dart';
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
              child: Stack(
                children: [
                  const SafeArea(
                      child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: BackButton(
                      color: CustomColors.white,
                    ),
                  )),
                  Center(
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listenWhen: (previous, current) =>
                          previous.signUpState.state !=
                          current.signUpState.state,
                      listener: (context, state) async {
                        if (state.signUpState.state == ResponseState.success) {
                          WeatherScreen.openAndRemoveAllRoute(context);
                        } else if (state.signUpState.state ==
                            ResponseState.error) {
                          showErrorPopUp(context, state.signUpState.message);
                        }
                      },
                      buildWhen: (previous, current) =>
                          previous.signUpState.state !=
                          current.signUpState.state,
                      builder: (context, state) {
                        if (state.signUpState.state == ResponseState.loading) {
                          return const CustomLoading();
                        } else {
                          return _form(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _form(BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: const [
          SignUpTitle(),
          AuthTitleFormHeightSeparator(),
          SignUpEmailTextField(),
          SizedBox(
            height: 25,
          ),
          SignUpPasswordTextField(),
          SizedBox(
            height: 24,
          ),
          SignInTextButton(),
          SizedBox(
            height: 48,
          ),
          SignUpButton()
        ],
      );

  static Future<void> open(BuildContext context) async =>
      Navigator.of(context).pushNamed(route);
}
