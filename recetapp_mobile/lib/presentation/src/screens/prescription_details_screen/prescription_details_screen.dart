import 'package:flutter/material.dart';
import 'package:recetapp_mobile/dependencies_injection/locator.dart';
import 'package:recetapp_mobile/domain/models/medication_schedule.dart';
import 'package:recetapp_mobile/domain/stores/prescription_details_store.dart';
import 'package:recetapp_mobile/domain/stores/scheduled_medications_store.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

const prescriptionDetailsScreenRoute = '/prescriptionDetailsScreenRoute';

/// Pantalla de detalles de una receta médica, escaneada o ingresada
/// manualmente. Si viene de un escaneo, [initialMedication] puede traer los
/// datos ya reconocidos para que el usuario los revise antes de aceptar.
///
/// Es solo presentación: toda la lógica de estado y validación vive en
/// [PrescriptionDetailsStore].
class PrescriptionDetailsScreen extends StatefulWidget {
  const PrescriptionDetailsScreen({super.key, this.initialMedication});

  final MedicationSchedule? initialMedication;

  @override
  State<PrescriptionDetailsScreen> createState() => _PrescriptionDetailsScreenState();
}

class _PrescriptionDetailsScreenState extends State<PrescriptionDetailsScreen> {
  final navigationService = locator<NavigationService>();
  late final PrescriptionDetailsStore _store;

  @override
  void initState() {
    super.initState();
    _store = PrescriptionDetailsStore(
      locator<ScheduledMedicationsStore>(),
      initialMedication: widget.initialMedication,
    );
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  void _onAcceptPressed() {
    if (_store.submit()) {
      navigationService.navigateToNamedRouteNoBackStack(homeScreenRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecetappPageTopBar(title: 'Nueva alarma'),
      bottomNavigationBar: PrescriptionDetailsBottomBar(
        onCancelPressed: () => navigationService.navigateToNamedRouteNoBackStack(homeScreenRoute),
        onAcceptPressed: _onAcceptPressed,
      ),
      body: RecetappBackground(child: PrescriptionFormWidget(store: _store)),
    );
  }
}
