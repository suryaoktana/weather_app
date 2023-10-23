import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/core/style/custom_colors.dart';
import '../../../../core/style/custom_values.dart';

class ContainerWithFrostedGlass extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsets childPadding;

  const ContainerWithFrostedGlass(
      {required this.child,
      this.borderRadius,
      this.childPadding = CustomValues.padding,
      super.key});

  @override
  Widget build(BuildContext context) => ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
          child: Container(
            width: double.infinity,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              gradient: const LinearGradient(stops: [
                0.2,
                0.8,
                1
              ], colors: [
                Colors.black,
                CustomColors.purple,
                CustomColors.lightPurple
              ]),
              borderRadius: borderRadius,
            ),
            child: Padding(
              padding: childPadding,
              child: child,
            ),
          ),
        ),
      );
}
