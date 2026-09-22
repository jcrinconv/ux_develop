import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:recetapp_mobile/domain/models/medication_presentation.dart';
import 'package:recetapp_mobile/domain/models/medication_schedule.dart';
import 'package:recetapp_mobile/domain/stores/scheduled_medications_store.dart';

part 'prescription_details_store.g.dart';

const prescriptionPresentationPlaceholder = 'Seleccionar';
final prescriptionPresentationOptions = [
  prescriptionPresentationPlaceholder,
  for (final presentation in MedicationPresentation.values) presentation.label,
];
const prescriptionStartDayOptions = ['Hoy', 'Mañana'];

const _defaultDoseCaption = 'Ej. 500 mg';
const _defaultDoseQuantityCaption = 'Unidades';

/// Estado y validación del formulario de una receta médica, escaneada o
/// ingresada manualmente. Al aceptar (`submit`), agrega el medicamento
/// resultante al [ScheduledMedicationsStore] compartido con el home.
class PrescriptionDetailsStore = _PrescriptionDetailsStore with _$PrescriptionDetailsStore;

abstract class _PrescriptionDetailsStore with Store {
  _PrescriptionDetailsStore(this._scheduledMedications, {MedicationSchedule? initialMedication})
    : nameController = TextEditingController(text: initialMedication?.name),
      doseController = TextEditingController(text: initialMedication?.dose),
      doseQuantityController = TextEditingController(text: initialMedication?.doseQuantity.toString()),
      durationController = TextEditingController(text: initialMedication?.treatmentDurationDays.toString()),
      hoursBetweenDosesController = TextEditingController(text: initialMedication?.hoursBetweenDoses.toString()),
      availableDosesController = TextEditingController(text: initialMedication?.availableDoses.toString()) {
    if (initialMedication != null) {
      presentation = initialMedication.presentation;
      startDay = initialMedication.startDay.label;
      hour = initialMedication.hour;
      minute = initialMedication.minute;
      period = initialMedication.period;
    }
  }

  final ScheduledMedicationsStore _scheduledMedications;

  final TextEditingController nameController;
  final TextEditingController doseController;
  final TextEditingController doseQuantityController;
  final TextEditingController durationController;
  final TextEditingController hoursBetweenDosesController;
  final TextEditingController availableDosesController;

  @observable
  String presentation = prescriptionPresentationPlaceholder;

  @observable
  String startDay = prescriptionStartDayOptions.last;

  @observable
  String hour = '09';

  @observable
  String minute = '05';

  @observable
  String period = 'am';

  @observable
  String? nameError;

  @observable
  String? presentationError;

  @observable
  String? doseError;

  @observable
  String? doseQuantityError;

  @observable
  String? durationError;

  @observable
  String? hoursBetweenDosesError;

  @observable
  String? availableDosesError;

  /// Caption del campo "Dosis" según la presentación seleccionada, ej.
  /// "Ej. 1 Tableta de 500 mg" para Tableta o "Ej. 1 Cucharada" para Jarabe.
  @computed
  String get doseCaption => MedicationPresentation.fromLabel(presentation)?.doseHint ?? _defaultDoseCaption;

  /// Caption del campo "Cantidad de dosis a tomar" según la presentación
  /// seleccionada, ej. "Tabletas" o "Cucharadas": la unidad que se toma
  /// cada vez que suena la alarma.
  @computed
  String get doseQuantityCaption =>
      MedicationPresentation.fromLabel(presentation)?.quantityUnit ?? _defaultDoseQuantityCaption;

  @action
  void setPresentation(String value) => presentation = value;

  @action
  void setStartDay(String value) => startDay = value;

  @action
  void setHour(String value) => hour = value;

  @action
  void setMinute(String value) => minute = value;

  @action
  void setPeriod(String value) => period = value;

  int? _parsePositiveInt(String value, {int min = 0}) {
    final parsed = int.tryParse(value.trim());
    if (parsed == null || parsed < min) return null;
    return parsed;
  }

  /// Valida el formulario y, si es válido, agrega el medicamento resultante
  /// a los medicamentos agendados. Retorna `true` cuando se agregó.
  @action
  bool submit() {
    final doseQuantity = _parsePositiveInt(doseQuantityController.text, min: 1);
    final duration = _parsePositiveInt(durationController.text, min: 1);
    final hoursBetweenDoses = _parsePositiveInt(hoursBetweenDosesController.text, min: 1);
    final availableDoses = _parsePositiveInt(availableDosesController.text, min: 0);

    nameError = nameController.text.trim().isEmpty ? 'Ingresa el nombre del medicamento' : null;
    presentationError = presentation == prescriptionPresentationPlaceholder ? 'Selecciona una presentación' : null;
    doseError = doseController.text.trim().isEmpty ? 'Ingresa la dosis' : null;
    doseQuantityError = doseQuantity == null ? 'Ingresa un número válido' : null;
    durationError = duration == null ? 'Ingresa un número válido' : null;
    hoursBetweenDosesError = hoursBetweenDoses == null ? 'Ingresa un número válido' : null;
    availableDosesError = availableDoses == null ? 'Ingresa un número válido' : null;

    final hasErrors = [
      nameError,
      presentationError,
      doseError,
      doseQuantityError,
      durationError,
      hoursBetweenDosesError,
      availableDosesError,
    ].any((error) => error != null);
    if (hasErrors) return false;

    _scheduledMedications.addMedication(
      MedicationSchedule(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: nameController.text.trim(),
        presentation: presentation,
        dose: doseController.text.trim(),
        doseQuantity: doseQuantity!,
        treatmentDurationDays: duration!,
        hoursBetweenDoses: hoursBetweenDoses!,
        startDay: MedicationStartDay.fromLabel(startDay),
        hour: hour,
        minute: minute,
        period: period,
        availableDoses: availableDoses!,
      ),
    );
    return true;
  }

  void dispose() {
    nameController.dispose();
    doseController.dispose();
    doseQuantityController.dispose();
    durationController.dispose();
    hoursBetweenDosesController.dispose();
    availableDosesController.dispose();
  }
}
