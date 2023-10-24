import 'package:flutter/material.dart';

import 'app_image.dart';

class BackgroundContainer extends Container {
  BackgroundContainer({super.child, super.key})
      : super(
            decoration: BoxDecoration(
                image: getJpgDecorationImage(
                    imageAsset: 'starry_night', fit: BoxFit.cover)));
}
