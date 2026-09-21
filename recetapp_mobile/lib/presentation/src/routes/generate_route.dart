import 'package:flutter/material.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';
import 'package:recetapp_mobile/presentation/src/screens/prescription_details_screen/prescription_details_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case scanPrescriptionScreenRoute:
      return MaterialPageRoute(builder: (_) => const ScanPrescriptionScreen());
    case prescriptionDetailsScreenRoute:
      return MaterialPageRoute(builder: (_) => const PrescriptionDetailsScreen());
    default:
      return MaterialPageRoute(builder: (_) => const NotFoundScreen());
  }
}
