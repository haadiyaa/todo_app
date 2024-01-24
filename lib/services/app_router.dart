import 'package:flutter/material.dart';
import 'package:todo_app/screens/homescreen.dart';
import 'package:todo_app/screens/recycle_bin.dart';

class AppRouter {
  Route? onGenerenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:return null;
    }
  }
}
