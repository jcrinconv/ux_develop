import 'package:mobx/mobx.dart';
import 'package:recetapp_mobile/domain/models/medication_schedule.dart';

part 'scheduled_medications_store.g.dart';

/// Mantiene el estado de los medicamentos agendados y lo comparte entre el
/// home y la pantalla de detalles de receta (escaneada o manual), que
/// agrega nuevos medicamentos a esta misma lista.
class ScheduledMedicationsStore = _ScheduledMedicationsStore with _$ScheduledMedicationsStore;

abstract class _ScheduledMedicationsStore with Store {
  _ScheduledMedicationsStore({List<MedicationSchedule>? initialMedications}) {
    if (initialMedications != null) medications.addAll(initialMedications);
  }

  @observable
  ObservableList<MedicationSchedule> medications = ObservableList<MedicationSchedule>();

  @computed
  int get scheduledDosesCount => medications.length;

  @computed
  int get takenDosesCount => medications.where((medication) => medication.taken).length;

  /// Agrega un medicamento proveniente de una receta médica (escaneada o
  /// ingresada manualmente) al listado de medicamentos agendados.
  @action
  void addMedication(MedicationSchedule medication) {
    medications.add(medication);
  }

  @action
  void toggleTaken(String id) {
    final index = medications.indexWhere((medication) => medication.id == id);
    if (index == -1) return;
    medications[index] = medications[index].copyWith(taken: !medications[index].taken);
  }
}
