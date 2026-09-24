import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

/// Fila/tarjeta de perfil (persona o mascota) con nombre, subtítulo y chevron.
/// [selected] la muestra rellena en verde (perfil activo).
class RecetappProfileRow extends StatelessWidget {
  const RecetappProfileRow({super.key, required this.name, required this.subtitle, this.selected = false, this.onTap});

  final String name;
  final String subtitle;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(10.r);

    return Material(
      color: selected ? RecetappThemeColors.primary : Colors.white,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          foregroundDecoration: selected
              ? null
              : BoxDecoration(
                  border: Border.all(color: RecetappThemeColors.mint),
                  borderRadius: borderRadius,
                ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: RecetappTextStyles.formLabel.copyWith(
                        color: selected ? RecetappThemeColors.onPrimary : RecetappThemeColors.darkGreen,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: RecetappTextStyles.body2.copyWith(
                        color: selected ? RecetappThemeColors.onPrimary : RecetappThemeColors.dustyGray,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              RecetappStrokeIcon(
                asset: selected ? RecetappIcons.chevronRightWhiteIcon : RecetappIcons.chevronRightGreyIcon,
                width: 6,
                height: 12,
                bleed: const Offset(0.8, 0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
