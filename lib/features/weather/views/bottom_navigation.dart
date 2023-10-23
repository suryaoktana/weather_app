import 'package:flutter/material.dart';
import '../../../core/style/custom_colors.dart';
import '../weather.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 70,
        margin: const EdgeInsets.only(top: 2),
        child: const ContainerWithFrostedGlass(
            child: Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home_rounded,
                color: CustomColors.white,
                size: 34,
              ),
              Icon(
                Icons.list,
                color: CustomColors.white,
                size: 36,
              )
            ],
          ),
        )),
      );
}
