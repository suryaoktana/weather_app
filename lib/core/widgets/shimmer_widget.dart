import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../style/custom_colors.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const ShimmerWidget(
      {required this.width, required this.height, this.radius = 8, super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: CustomColors.gray.withOpacity(0.2),
        highlightColor: CustomColors.gray,
        child: Container(
          decoration: BoxDecoration(
              color: CustomColors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(radius)),
          height: height,
          width: width,
        ),
      );
}
