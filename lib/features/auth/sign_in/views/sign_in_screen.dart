import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/base_response.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/widgets/container_with_frosted_glass.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/background_container.dart';
import '../../../weather/views/views.dart';
import '../../auth.dart';
import '../sign_in.dart';
import '../widgets/sign_in_button.dart';

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
                child: BlocConsumer<AuthBloc, AuthState>(
                  listenWhen: (previous, current) =>
                      previous.signInState.state != current.signInState.state,
                  listener: (context, state) async {
                    if (state.signInState.state == ResponseState.success) {
                      WeatherScreen.openAndRemoveAllRoute(context);
                    } else if (state.signInState.state == ResponseState.error) {
                      showErrorPopUp(context, state.signInState.message);
                    }
                  },
                  buildWhen: (previous, current) =>
                      previous.signInState.state != current.signInState.state,
                  builder: (context, state) {
                    if (state.signInState.state == ResponseState.loading) {
                      return const CustomLoading();
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
        padding: const EdgeInsets.symmetric(vertical: 24),
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: const [
          SignInTitle(),
          AuthTitleFormHeightSeparator(),
          SignInEmailTextField(),
          SizedBox(
            height: 25,
          ),
          SignInPasswordTextField(),
          SizedBox(
            height: 24,
          ),
          SignUpTextButton(),
          SizedBox(
            height: 48,
          ),
          SignInButton(),
          SizedBox(
            height: 16,
          ),
          SignInWithGoogleButton(),
        ],
      );

  static Future<void> openAndRemoveAllRoute(BuildContext context) async =>
      Navigator.of(context, rootNavigator: true)
          .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
}
