import 'package:flutter/material.dart';
import '../../style/custom_colors.dart';
import '../custom_text.dart';

enum ButtonPrimaryType {
  solidPrimary,
  solidWhite,
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final bool disabled;
  final ButtonPrimaryType buttonPrimaryType;
  final FontStyle fontStyle;
  final VoidCallback onTap;
  final bool expandableHeight;
  final Widget? child;
  final Color? labelColor;

  PrimaryButton(
      {this.label = '',
      this.buttonPrimaryType = ButtonPrimaryType.solidPrimary,
      this.disabled = false,
      required this.onTap,
      this.fontStyle = FontStyle.italic,
      this.expandableHeight = false,
      this.labelColor,
      this.child,
      Key? key})
      : super(key: key);

  final ButtonStyle _defaultButtonStyle = ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: const Size(50, 100),
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ));

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: SizedBox(
        height: expandableHeight ? null : 50,
        child: ElevatedButton(
            style: _getDefaultButtonStyle,
            onPressed: () {
              if (!disabled) {
                FocusManager.instance.primaryFocus?.unfocus();
                onTap();
              }
            },
            child: child ??
                CustomText(
                  label,
                  style: CustomTextStyle.lightComponentsButtonLarge
                      .copyWith(color: labelColor),
                )),
      ),
    );
  }

  ButtonStyle get _getDefaultButtonStyle {
    switch (buttonPrimaryType) {
      case ButtonPrimaryType.solidPrimary:
        return _defaultButtonStyle.copyWith(
            minimumSize: _getButtonMinimumSize,
            backgroundColor: _getColor(
                disabled
                    ? CustomColors.gray
                    : CustomColors.lightPurpleSecondary,
                CustomColors.lightPurpleSecondary.withOpacity(0.9)),
            foregroundColor: _getColor(
                disabled ? CustomColors.darkGray : CustomColors.white,
                CustomColors.lightPurpleSecondary.withOpacity(0.9)),
            shape: _getBorder(
              Colors.transparent,
              Colors.transparent,
            ));
      case ButtonPrimaryType.solidWhite:
        return _defaultButtonStyle.copyWith(
            minimumSize: _getButtonMinimumSize,
            backgroundColor: _getColor(
                disabled ? CustomColors.gray : CustomColors.white,
                CustomColors.white.withOpacity(0.9)),
            foregroundColor: _getColor(
                disabled ? CustomColors.darkGray : CustomColors.white,
                CustomColors.white.withOpacity(0.9)),
            shape: _getBorder(
              Colors.transparent,
              Colors.transparent,
            ));
    }
  }

  MaterialStateProperty<Color> _getColor(Color color, Color colorPressed) {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    });
  }

  MaterialStateProperty<OutlinedBorder> _getBorder(
      Color color, Color colorPressed) {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          side: BorderSide(
              width: 1.5,
              color: states.contains(MaterialState.pressed)
                  ? colorPressed
                  : color));
    });
  }

  MaterialStateProperty<Size?> get _getButtonMinimumSize {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      return const Size.fromWidth(double.infinity);
    });
  }
}
