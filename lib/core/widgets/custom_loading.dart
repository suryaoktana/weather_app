import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox(
      height: 100,
      width: 100,
      child: CircularProgressIndicator(
        strokeWidth: 10,
      ));
}
