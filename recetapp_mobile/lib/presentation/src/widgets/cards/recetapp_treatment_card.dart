import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

/// Tarjeta de un tratamiento/dosis: nombre, presentación, frecuencia,
/// duración, hora y un botón circular para marcar como tomada.
class RecetappTreatmentCard extends StatelessWidget {
  const RecetappTreatmentCard({
    super.key,
    required this.name,
    required this.presentation,
    required this.frequency,
    required this.duration,
    required this.time,
    this.taken = false,
    this.highlighted = false,
    this.onToggle,
  });

  final String name;
  final String presentation;
  final String frequency;
  final String duration;
  final String time;
  final bool taken;
  final bool highlighted;
  final VoidCallback? onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: highlighted ? RecetappThemeColors.background : Colors.white,
        border: Border.all(color: highlighted ? RecetappThemeColors.primary : RecetappThemeColors.mint),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: RecetappTextStyles.formLabel.copyWith(color: RecetappThemeColors.primary)),
                SizedBox(height: 4.h),
                Text(presentation, style: RecetappTextStyles.body2.copyWith(color: RecetappThemeColors.doveGray)),
                SizedBox(height: 4.h),
                Text(frequency, style: RecetappTextStyles.body2.copyWith(color: RecetappThemeColors.doveGray)),
                SizedBox(height: 4.h),
                Text(duration, style: RecetappTextStyles.hint.copyWith(color: RecetappThemeColors.dustyGray)),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(time, style: RecetappTextStyles.h3Bold.copyWith(color: RecetappThemeColors.textPrimary)),
              SizedBox(height: 12.h),
              InkWell(
                onTap: onToggle,
                customBorder: const CircleBorder(),
                child: Container(
                  width: 29.w,
                  height: 29.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: taken ? RecetappThemeColors.primary : Colors.transparent,
                    border: Border.all(color: RecetappThemeColors.primary),
                  ),
                  child: Icon(
                    Icons.check_rounded,
                    size: 11.w,
                    color: taken ? RecetappThemeColors.onPrimary : RecetappThemeColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
