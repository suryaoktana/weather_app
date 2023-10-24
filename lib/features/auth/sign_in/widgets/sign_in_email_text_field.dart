import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth.dart';
import '../sign_in.dart';

class SignInEmailTextField extends StatelessWidget {
  const SignInEmailTextField({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<SignInBloc, SignInState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) => EmailTextField(
          initialValue: state.email,
          onChanged: (value) => context
              .read<SignInBloc>()
              .add(SignInEvent.emailChanged(email: value)),
        ),
      );
}
