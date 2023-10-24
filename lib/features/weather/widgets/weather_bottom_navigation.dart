import 'package:flutter/material.dart';
import '../../../core/style/custom_colors.dart';
import '../../../core/widgets/container_with_frosted_glass.dart';

class WeatherBottomNavigation extends StatelessWidget {
  final TabController tabController;
  const WeatherBottomNavigation({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 70,
        margin: const EdgeInsets.only(top: 2),
        child: ContainerWithFrostedGlass(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TabBar(
              controller: tabController,
              indicatorWeight: 1,
              indicatorColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.transparent,
              tabs: const [
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
          ),
        ),
      );
}
