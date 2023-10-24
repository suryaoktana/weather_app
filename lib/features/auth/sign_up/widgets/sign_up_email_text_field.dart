import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth.dart';
import '../sign_up.dart';

class SignUpEmailTextField extends StatelessWidget {
  const SignUpEmailTextField({super.key});

  @override
  Widget build(BuildContext context) => EmailTextField(
      onChanged: (value) => context
          .read<SignUpBloc>()
          .add(SignUpEvent.emailChanged(email: value)),
      errorText: '');
}
