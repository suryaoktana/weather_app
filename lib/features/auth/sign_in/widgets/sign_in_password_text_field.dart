import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth.dart';
import '../sign_in.dart';

class SignInPasswordTextField extends StatelessWidget {
  const SignInPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<SignInBloc, SignInState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) => PasswordTextField(
          initialValue: state.password,
          onChanged: (value) => context
              .read<SignInBloc>()
              .add(SignInEvent.passwordChanged(password: value)),
        ),
      );
}
