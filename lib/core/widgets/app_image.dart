import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget getSvgImage(String assetName,
        {Color? color,
        double? height,
        double? width,
        BoxFit fit = BoxFit.contain}) =>
    SvgPicture.asset(
      'assets/images/$assetName.svg',
      color: color,
      height: height,
      width: width,
      fit: fit,
    );

Image getPngImage(String imageName,
        {double? height, double? width, Color? color, BoxFit? fit}) =>
    Image.asset(
      'assets/images/$imageName.png',
      height: height,
      width: width,
      color: color,
      fit: fit,
    );

Image getJpgImage(String imageName,
        {double? height, double? width, Color? color, BoxFit? fit}) =>
    Image.asset(
      'assets/images/$imageName.jpg',
      height: height,
      width: width,
      color: color,
      fit: fit,
    );

DecorationImage getPngDecorationImage(
        {required String imageAsset, BoxFit? fit}) =>
    DecorationImage(
        image: AssetImage('assets/images/$imageAsset.png'), fit: fit);

DecorationImage getJpgDecorationImage(
        {required String imageAsset, BoxFit? fit}) =>
    DecorationImage(
        image: AssetImage('assets/images/$imageAsset.jpg'), fit: fit);
