import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth.dart';
import '../sign_in.dart';

class SignInEmailTextField extends StatelessWidget {
  const SignInEmailTextField({super.key});

  @override
  Widget build(BuildContext context) => EmailTextField(
      onChanged: (value) => context
          .read<SignInBloc>()
          .add(SignInEvent.emailChanged(email: value)),
      errorText: '');
}
