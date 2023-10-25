import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/base_response.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/widgets/container_with_frosted_glass.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/background_container.dart';
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
                  listenWhen: (_, current) =>
                      current.signInState.state == ResponseState.error,
                  listener: (context, state) =>
                      showErrorPopUp(context, state.signInState.message),
                  buildWhen: (previous, current) =>
                      previous.signInState != current.signInState,
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

  static Future<void> open(BuildContext context) async =>
      Navigator.of(context).pushNamed(route);
}
