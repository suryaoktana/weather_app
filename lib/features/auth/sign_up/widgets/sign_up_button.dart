import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/buttons/primary_button.dart';
import '../../auth.dart';
import '../sign_up.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) =>
            previous.email != current.email ||
            previous.password != current.password,
        builder: (context, state) => PrimaryButton(
          label: 'Sign Up',
          onTap: () => context.read<AuthBloc>().add(AuthEvent.signUpSubmitted(
              email: state.email, password: state.password)),
        ),
      );
}
