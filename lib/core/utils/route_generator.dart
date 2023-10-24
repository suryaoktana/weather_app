import 'package:flutter/material.dart';
import '../../features/auth/sign_in/sign_in.dart';
import '../../features/auth/sign_up/sign_up.dart';
import '../../features/weather/weather.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignInScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignInScreen());
      case SignUpScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignUpScreen());
      case WeatherScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const WeatherScreen());
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
