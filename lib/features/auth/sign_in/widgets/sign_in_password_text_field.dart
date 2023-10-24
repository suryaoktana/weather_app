import '../../auth.dart';

class SignInPasswordTextField extends PasswordTextField {
  SignInPasswordTextField({super.key})
      : super(onChanged: (_) {}, errorText: '');
}
