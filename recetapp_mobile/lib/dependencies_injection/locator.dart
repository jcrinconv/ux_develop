import 'package:get_it/get_it.dart';
import 'package:recetapp_mobile/domain/models/medication_schedule.dart';
import 'package:recetapp_mobile/domain/stores/scheduled_medications_store.dart';

import '../presentation/presentation.dart';

/// {@category Dependencies Injection}
/// @nodoc
GetIt locator = GetIt.instance;

void startServiceLocator() {
  locator.registerSingleton<NavigationService>(NavigationService());
  locator.registerSingleton<ScheduledMedicationsStore>(
    ScheduledMedicationsStore(initialMedications: _seedMedications),
  );
}

final _seedMedications = [
  MedicationSchedule(
    id: 'seed-1',
    name: 'Amoxicilina',
    presentation: 'Cápsula',
    dose: '500 mg',
    doseQuantity: 1,
    treatmentDurationDays: 7,
    hoursBetweenDoses: 8,
    startDay: MedicationStartDay.today,
    hour: '08',
    minute: '00',
    period: 'am',
    availableDoses: 21,
  ),
  MedicationSchedule(
    id: 'seed-2',
    name: 'Paracetamol',
    presentation: 'Tableta',
    dose: '500 mg',
    doseQuantity: 1,
    treatmentDurationDays: 3,
    hoursBetweenDoses: 6,
    startDay: MedicationStartDay.today,
    hour: '10',
    minute: '00',
    period: 'am',
    availableDoses: 12,
    taken: true,
  ),
  MedicationSchedule(
    id: 'seed-3',
    name: 'Loratadina',
    presentation: 'Tableta',
    dose: '10 mg',
    doseQuantity: 1,
    treatmentDurationDays: 5,
    hoursBetweenDoses: 24,
    startDay: MedicationStartDay.today,
    hour: '08',
    minute: '00',
    period: 'pm',
    availableDoses: 5,
  ),
];
