import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/app_image.dart';
import 'auth_text_field_style.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final String errorText;
  final String initialValue;
  final Function(String)? onChanged;

  const PasswordTextField({
    Key? key,
    this.onChanged,
    this.hintText = '',
    this.errorText = '',
    this.initialValue = '',
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController controller = TextEditingController();
  late final TextEditingController confirmationController;
  bool obscureText = true;

  @override
  void initState() {
    controller.text = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Theme(
      data: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: CustomColors.purple,
            ),
      ),
      child: Focus(
        child: _textFormField(
          key: const Key('password_input'),
          controller: controller,
          onChanged: widget.onChanged,
          obscureText: obscureText,
          onObscureTextTap: () => setState(() {
            obscureText = !obscureText;
          }),
        ),
      ));

  TextFormField _textFormField(
      {required TextEditingController controller,
      required bool obscureText,
      required VoidCallback onObscureTextTap,
      Function(String)? onChanged,
      String hintText = 'Password',
      String errorText = '',
      Key? key}) {
    return TextFormField(
      key: key,
      cursorColor: CustomColors.white,
      controller: controller,
      onChanged: onChanged,
      inputFormatters: [
        LengthLimitingTextInputFormatter(16),
        FilteringTextInputFormatter.deny(RegExp(r'\s'))
      ],
      obscureText: obscureText,
      obscuringCharacter: '●',
      style: AuthTextFieldStyle.valueTextStyle,
      decoration: AuthTextFieldStyle.inputDecoration.copyWith(
        prefixIcon: const Icon(
          Icons.key,
        ),
        hintText: hintText,
        errorText: errorText.isEmpty ? null : errorText,
        suffixIcon: GestureDetector(
          onTap: onObscureTextTap,
          child: UnconstrainedBox(
            child: Padding(
              padding: EdgeInsets.only(top: obscureText ? 2 : 0),
              child: getSvgImage(
                  obscureText
                      ? 'icon_obscure_text_disable'
                      : 'icon_obscure_text_enable',
                  color: obscureText ? null : CustomColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
