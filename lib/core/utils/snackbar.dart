import 'package:flutter/material.dart';

import '../style/custom_colors.dart';
import '../widgets/custom_text.dart';

void showErrorPopUp(BuildContext context, String message) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.only(bottom: 20),
        behavior: SnackBarBehavior.floating,
        backgroundColor: CustomColors.lightPurple,
        content: CustomText(
          message,
          style: CustomTextStyle.body1.copyWith(color: CustomColors.white),
        ),
      ),
    );
