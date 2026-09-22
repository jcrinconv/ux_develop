import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/domain/stores/prescription_details_store.dart';
import 'package:recetapp_mobile/presentation/src/widgets/widgets.dart';

/// Formulario para los datos de una receta médica, escaneada o ingresada
/// manualmente. Toda su lógica (estado, validación y envío) vive en
/// [PrescriptionDetailsStore]; este widget solo la observa y la muestra.
class PrescriptionFormWidget extends StatelessWidget {
  const PrescriptionFormWidget({super.key, required this.store});

  final PrescriptionDetailsStore store;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Observer(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecetappTextField(label: 'Medicamento', controller: store.nameController, errorText: store.nameError),
              SizedBox(height: 13.h),
              RecetappSelectField(
                label: 'Presentación',
                value: store.presentation,
                options: prescriptionPresentationOptions,
                onChanged: store.setPresentation,
              ),
              SizedBox(height: 13.h),
              RecetappTextField(
                label: 'Dosis',
                caption: store.doseCaption,
                controller: store.doseController,
                errorText: store.doseError,
              ),
              SizedBox(height: 13.h),
              RecetappTextField(
                label: 'Cantidad de dosis a tomar',
                caption: store.doseQuantityCaption,
                controller: store.doseQuantityController,
                errorText: store.doseQuantityError,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 13.h),
              RecetappTextField(
                label: 'Duración del tratamiento',
                caption: 'Días',
                controller: store.durationController,
                errorText: store.durationError,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 13.h),
              RecetappTextField(
                label: 'Horas entre dosis',
                caption: 'Horas',
                controller: store.hoursBetweenDosesController,
                errorText: store.hoursBetweenDosesError,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 13.h),
              RecetappChoiceChips(
                label: 'Día de inicio',
                options: prescriptionStartDayOptions,
                selected: store.startDay,
                onChanged: store.setStartDay,
              ),
              SizedBox(height: 13.h),
              RecetappTimePicker(
                hour: store.hour,
                minute: store.minute,
                period: store.period,
                onHourChanged: store.setHour,
                onMinuteChanged: store.setMinute,
                onPeriodChanged: store.setPeriod,
              ),
              SizedBox(height: 13.h),
              RecetappTextField(
                label: 'Dosis disponibles',
                controller: store.availableDosesController,
                errorText: store.availableDosesError,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
