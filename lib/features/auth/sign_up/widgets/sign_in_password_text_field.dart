import '../../auth.dart';

class SignUpPasswordTextField extends PasswordTextField {
  SignUpPasswordTextField({super.key})
      : super(onChanged: (_) {}, errorText: '');
}
