import 'package:cached_network_image/cached_network_image.dart';
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

CachedNetworkImage getCachedNetworkImage({
  required String imageUrl,
  double? height,
  double? width,
  BoxFit? fit,
}) =>
    CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const Padding(
        padding: EdgeInsets.all(6.0),
        child: CircularProgressIndicator(strokeWidth: 6,),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      height: height,
      width: width,
      fit: fit,
    );
