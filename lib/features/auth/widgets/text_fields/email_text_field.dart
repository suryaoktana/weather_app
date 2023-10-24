import 'package:flutter/material.dart';
import '../../../../core/style/custom_colors.dart';
import 'auth_text_field_style.dart';

class EmailTextField extends StatelessWidget {
  final String initialValue;
  final Function(String)? onChanged;

  const EmailTextField({this.onChanged, this.initialValue = '', super.key});

  @override
  Widget build(BuildContext context) => TextFormField(
        initialValue: initialValue,
        cursorColor: CustomColors.white,
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        style: AuthTextFieldStyle.valueTextStyle,
        decoration: AuthTextFieldStyle.inputDecoration.copyWith(
          prefixIcon: const Icon(
            Icons.email,
          ),
          hintText: 'Email',
        ),
      );
}
