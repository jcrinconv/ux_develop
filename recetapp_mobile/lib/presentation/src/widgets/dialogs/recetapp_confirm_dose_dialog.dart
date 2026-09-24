import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

Future<String?> showConfirmDoseDialog(BuildContext context, {required String medicationName}) {
  return showDialog<String>(
    context: context,
    barrierColor: recetappScrimColor,
    builder: (_) => RecetappConfirmDoseDialog(medicationName: medicationName),
  );
}

class RecetappConfirmDoseDialog extends StatefulWidget {
  const RecetappConfirmDoseDialog({super.key, required this.medicationName});

  final String medicationName;

  @override
  State<RecetappConfirmDoseDialog> createState() => _RecetappConfirmDoseDialogState();
}

class _RecetappConfirmDoseDialogState extends State<RecetappConfirmDoseDialog> {
  late String _hour;
  late String _minute;
  late String _period;

  @override
  void initState() {
    super.initState();
    final now = TimeOfDay.now();
    final hour12 = now.hourOfPeriod == 0 ? 12 : now.hourOfPeriod;
    _hour = hour12.toString().padLeft(2, '0');
    _minute = now.minute.toString().padLeft(2, '0');
    _period = now.period == DayPeriod.am ? 'am' : 'pm';
  }

  @override
  Widget build(BuildContext context) {
    return RecetappModal(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecetappModalHeader(
            title: 'Confirmar toma de ${widget.medicationName}',
            onClose: () => Navigator.of(context).pop(),
          ),
          SizedBox(height: 16.h),
          Text(
            'Registra la hora real en la que tomaste la dosis.',
            style: RecetappTextStyles.body2.copyWith(color: RecetappThemeColors.doveGray),
          ),
          SizedBox(height: 16.h),
          RecetappTimePicker(
            label: 'Tomada a las',
            hour: _hour,
            minute: _minute,
            period: _period,
            onHourChanged: (value) => setState(() => _hour = value),
            onMinuteChanged: (value) => setState(() => _minute = value),
            onPeriodChanged: (value) => setState(() => _period = value),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RecetappButton(
                label: 'Omitir',
                onPressed: () => Navigator.of(context).pop(),
                variant: RecetappButtonVariant.text,
                color: RecetappThemeColors.accent,
              ),
              SizedBox(width: 12.w),
              RecetappButton(
                label: 'Confirmar',
                onPressed: () => Navigator.of(context).pop('$_hour:$_minute $_period'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
