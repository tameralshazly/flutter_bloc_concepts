import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/third_screen.dart';

import '../screens/settings_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => Builder(builder: (context) {
            return const HomeScreen(
              title: 'HomeScreen',
              color: Colors.blueAccent,
            );
          }),
        );

      case '/SecondScreen':
        return MaterialPageRoute(
          builder: (_) => Builder(builder: (context) {
            return const SecondScreen(
              title: 'SecondScreen',
              color: Colors.redAccent,
            );
          }),
        );
      case '/ThirdScreen':
        return MaterialPageRoute(
          builder: (_) => Builder(builder: (context) {
            return const ThirdScreen(
              title: 'ThirdScreen',
              color: Colors.greenAccent,
            );
          }),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Builder(builder: (context) {
            return const SecondScreen(
              title: 'SecondScreen',
              color: Colors.blueAccent,
            );
          }),
        );
    }
  }
}
