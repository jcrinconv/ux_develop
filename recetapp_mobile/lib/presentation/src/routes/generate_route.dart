import 'package:flutter/material.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    default:
      return MaterialPageRoute(builder: (_) => NotFoundScreen());
  }
}
