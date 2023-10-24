import 'package:flutter/material.dart';
import '../../../../core/style/custom_colors.dart';
import '../../../../core/widgets/custom_text.dart';
import 'auth_text_field_style.dart';

class EmailTextField extends StatelessWidget {
  final String errorText;
  final Function(String)? onChanged;

  const EmailTextField({this.onChanged, this.errorText = '', super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
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
            )),
        if (errorText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 56, top: 8),
            child: CustomText(
              errorText,
              style: CustomTextStyle.body2.copyWith(color: CustomColors.red),
            ),
          )
      ],
    );
  }
}
