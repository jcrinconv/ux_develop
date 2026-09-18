import 'package:flutter/material.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

/// Selector de hora: etiqueta + tres cajas (hora, minuto, am/pm), cada una
/// desplegable de forma independiente.
class RecetappTimePicker extends StatelessWidget {
  const RecetappTimePicker({
    super.key,
    this.label = 'Hora',
    required this.hour,
    required this.minute,
    required this.period,
    required this.onHourChanged,
    required this.onMinuteChanged,
    required this.onPeriodChanged,
    this.hours = const ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
    this.minutes = const ['00', '05', '10', '15', '20', '25', '30', '35', '40', '45', '50', '55'],
    this.periods = const ['am', 'pm'],
  });

  final String label;
  final String hour;
  final String minute;
  final String period;
  final ValueChanged<String> onHourChanged;
  final ValueChanged<String> onMinuteChanged;
  final ValueChanged<String> onPeriodChanged;
  final List<String> hours;
  final List<String> minutes;
  final List<String> periods;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: RecetappTextStyles.formLabel),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecetappDropdownField(value: hour, options: hours, onChanged: onHourChanged),
            const SizedBox(width: 12),
            RecetappDropdownField(value: minute, options: minutes, onChanged: onMinuteChanged),
            const SizedBox(width: 12),
            RecetappDropdownField(value: period, options: periods, onChanged: onPeriodChanged),
          ],
        ),
      ],
    );
  }
}
