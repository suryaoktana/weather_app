import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpPasswordTextField extends StatelessWidget {
  const SignUpPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) => PasswordTextField(
          initialValue: state.password,
          onChanged: (value) => context
              .read<SignUpBloc>()
              .add(SignUpEvent.passwordChanged(password: value)),
        ),
      );
}
