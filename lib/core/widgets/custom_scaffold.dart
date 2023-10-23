import 'package:flutter/material.dart';

import '../style/custom_colors.dart';

class CustomScaffold extends Scaffold {
  CustomScaffold({
    super.key,
    required Widget body,
    super.bottomNavigationBar,
    super.backgroundColor = Colors.transparent,
  }) : super(
            body: body,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 0,
            ));
}
