import 'package:flutter/material.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case scanPrescriptionScreenRoute:
      return MaterialPageRoute(builder: (_) => const ScanPrescriptionScreen());
    default:
      return MaterialPageRoute(builder: (_) => const NotFoundScreen());
  }
}
