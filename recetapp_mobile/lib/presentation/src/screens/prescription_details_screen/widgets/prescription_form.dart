import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/src/widgets/widgets.dart';

class PrescriptionFormWidget extends StatelessWidget {
  const PrescriptionFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecetappTextField(label: 'Medicamento'),
            SizedBox(height: 13.h),
            RecetappSelectField(label: 'Presentación', value: 'Seleccionar', options: ['Seleccionar'], onChanged: (value) {}),
            SizedBox(height: 13.h),
            RecetappTextField(label: 'Dosis', caption: 'Pastilla'),
            SizedBox(height: 13.h),
            RecetappTextField(label: 'Cantidad de dosis a tomar', caption: 'Pastillas'),
            SizedBox(height: 13.h),
            RecetappTextField(label: 'Duración del tratamiento', caption: 'Días'),
            SizedBox(height: 13.h),
            RecetappTextField(label: 'Horas entre dosis', caption: 'Horas'),
            SizedBox(height: 13.h),
            RecetappChoiceChips(
              label: 'Día de inicio',
              options: ['Hoy', 'Mañana'],
              selected: 'Mañana',
              onChanged: (String value) {},
            ),
            SizedBox(height: 13.h),
            RecetappTimePicker(
              hour: '09',
              minute: '05',
              period: 'am',
              onHourChanged: (value) {},
              onMinuteChanged: (value) {},
              onPeriodChanged: (value) {},
            ),
            SizedBox(height: 13.h),
            RecetappTextField(label: 'Dosis disponibles'),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
