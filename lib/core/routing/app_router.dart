import 'package:chat_bot_app/core/routing/routes.dart';
import 'package:chat_bot_app/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:flutter/material.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
