import 'package:flutter/material.dart';
import 'package:recetapp_mobile/dependencies_injection/locator.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

const prescriptionDetailsScreenRoute = '/prescriptionDetailsScreenRoute';

class PrescriptionDetailsScreen extends StatefulWidget {
  const PrescriptionDetailsScreen({super.key});

  @override
  State<PrescriptionDetailsScreen> createState() => _PrescriptionDetailsScreenState();
}

class _PrescriptionDetailsScreenState extends State<PrescriptionDetailsScreen> {
  final navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecetappPageTopBar(title: 'Nueva alarma'),
      bottomNavigationBar: PrescriptionDetailsBottomBar(
        onCancelPressed: () => navigationService.navigateToNamedRouteNoBackStack(homeScreenRoute),
        onAcceptPressed: () {},
      ),
      body: RecetappBackground(child: PrescriptionFormWidget()),
    );
  }
}
