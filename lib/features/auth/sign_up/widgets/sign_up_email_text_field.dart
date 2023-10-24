import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth.dart';
import '../sign_up.dart';

class SignUpEmailTextField extends StatelessWidget {
  const SignUpEmailTextField({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) => EmailTextField(
            initialValue: state.email,
            onChanged: (value) => context
                .read<SignUpBloc>()
                .add(SignUpEvent.emailChanged(email: value)),
            errorText: ''),
      );
}
