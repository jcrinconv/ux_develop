import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        SizedBox(height: 8.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecetappDropdownField(
              value: hour,
              options: hours,
              onChanged: onHourChanged,
              width: 75.w,
              internalPadding: EdgeInsets.only(left: 14.w, top: 10.h, bottom: 10.h, right: 5.w),
            ),
            SizedBox(width: 8.w),
            RecetappDropdownField(
              value: minute,
              options: minutes,
              onChanged: onMinuteChanged,
              width: 75.w,
              internalPadding: EdgeInsets.only(left: 14.w, top: 10.h, bottom: 10.h, right: 5.w),
            ),
            SizedBox(width: 8.w),
            RecetappDropdownField(
              value: period,
              options: periods,
              onChanged: onPeriodChanged,
              width: 80.w,
              internalPadding: EdgeInsets.only(left: 14.w, top: 10.h, bottom: 10.h, right: 5.w),
            ),
          ],
        ),
      ],
    );
  }
}
