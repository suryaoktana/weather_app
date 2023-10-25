import 'package:flutter/material.dart';

class AuthTitleFormHeightSeparator extends StatelessWidget {
  const AuthTitleFormHeightSeparator({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height / 14,
      );
}
