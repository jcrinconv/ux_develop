const _spanishMonthsCapitalized = [
  'Enero',
  'Febrero',
  'Marzo',
  'Abril',
  'Mayo',
  'Junio',
  'Julio',
  'Agosto',
  'Septiembre',
  'Octubre',
  'Noviembre',
  'Diciembre',
];

/// Día en que inicia el tratamiento de un medicamento agendado. El de
/// pasado mañana no tiene una etiqueta fija: se calcula con la fecha
/// actual, ej. "23/Agosto".
enum MedicationStartDay {
  today,
  tomorrow,
  dayAfterTomorrow;

  String get label {
    switch (this) {
      case MedicationStartDay.today:
        return 'Hoy';
      case MedicationStartDay.tomorrow:
        return 'Mañana';
      case MedicationStartDay.dayAfterTomorrow:
        final date = DateTime.now().add(const Duration(days: 2));
        return '${date.day}/${_spanishMonthsCapitalized[date.month - 1]}';
    }
  }

  static MedicationStartDay fromLabel(String label) =>
      MedicationStartDay.values.firstWhere((day) => day.label == label, orElse: () => MedicationStartDay.today);
}

/// Medicamento agendado a partir de una receta médica, escaneada o
/// ingresada manualmente, que se muestra en el listado del home.
class MedicationSchedule {
  MedicationSchedule({
    required this.id,
    required this.name,
    required this.presentation,
    required this.dose,
    required this.doseQuantity,
    required this.treatmentDurationDays,
    required this.hoursBetweenDoses,
    required this.startDay,
    required this.hour,
    required this.minute,
    required this.period,
    required this.availableDoses,
    this.taken = false,
  });

  final String id;
  final String name;
  final String presentation;
  final String dose;
  final int doseQuantity;
  final int treatmentDurationDays;
  final int hoursBetweenDoses;
  final MedicationStartDay startDay;
  final String hour;
  final String minute;
  final String period;
  final int availableDoses;
  final bool taken;

  /// Ej. "500 mg - Cápsula".
  String get presentationLabel => '$dose - $presentation';

  /// Ej. "Cada 8 horas".
  String get frequencyLabel => 'Cada $hoursBetweenDoses horas';

  /// Ej. "7 días".
  String get durationLabel => '$treatmentDurationDays días';

  /// Hora de la primera toma en formato 24 horas, ej. "08:00".
  String get timeLabel {
    int hour24 = int.parse(hour) % 12;
    if (period.toLowerCase() == 'pm') hour24 += 12;
    return '${hour24.toString().padLeft(2, '0')}:$minute';
  }

  MedicationSchedule copyWith({bool? taken}) => MedicationSchedule(
    id: id,
    name: name,
    presentation: presentation,
    dose: dose,
    doseQuantity: doseQuantity,
    treatmentDurationDays: treatmentDurationDays,
    hoursBetweenDoses: hoursBetweenDoses,
    startDay: startDay,
    hour: hour,
    minute: minute,
    period: period,
    availableDoses: availableDoses,
    taken: taken ?? this.taken,
  );
}
