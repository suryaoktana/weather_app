import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/base_response.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/widgets/container_with_frosted_glass.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/custom_scaffold.dart';
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
              child: Center(
                child: BlocConsumer<AuthBloc, AuthState>(
                  listenWhen: (_, current) =>
                      current.signUpState.state == ResponseState.error,
                  listener: (context, state) =>
                      showErrorPopUp(context, state.signUpState.message),
                  buildWhen: (previous, current) =>
                      previous.signUpState.state != current.signUpState.state,
                  builder: (context, state) {
                    if (state.signUpState.state == ResponseState.loading) {
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
