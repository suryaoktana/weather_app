import 'package:flutter/material.dart';

class CustomScaffold extends Scaffold {
  const CustomScaffold({
    super.key,
    required Widget body,
    super.bottomNavigationBar,
    super.backgroundColor = Colors.transparent,
  }) : super(
          body: body,
        );
}
