import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/buttons/primary_button.dart';
import '../../auth.dart';
import '../sign_in.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<SignInBloc, SignInState>(
        buildWhen: (previous, current) =>
            previous.email != current.email ||
            previous.password != current.password,
        builder: (context, state) => PrimaryButton(
          label: 'Sign In',
          onTap: () => context.read<AuthBloc>().add(AuthEvent.signInSubmitted(
              email: state.email, password: state.password)),
        ),
      );
}
