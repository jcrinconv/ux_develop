const _spanishMonths = [
  'enero',
  'febrero',
  'marzo',
  'abril',
  'mayo',
  'junio',
  'julio',
  'agosto',
  'septiembre',
  'octubre',
  'noviembre',
  'diciembre',
];

extension RecetappDateFormatting on DateTime {
  /// Formatea la fecha como "23 de agosto".
  String get dayAndMonth => '$day de ${_spanishMonths[month - 1]}';

  /// Formatea la fecha como "Hoy, 23 de agosto".
  String get todayLabel => 'Hoy, $dayAndMonth';
}
