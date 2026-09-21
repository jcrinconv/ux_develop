import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

class PrescriptionDetailsBottomBar extends StatelessWidget {
  const PrescriptionDetailsBottomBar({super.key, required this.onCancelPressed, required this.onAcceptPressed});

  final VoidCallback? onCancelPressed;
  final VoidCallback? onAcceptPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: RecetappThemeColors.darkGreen.withValues(alpha: 0.1))),
      ),
      padding: EdgeInsets.only(top: 14.h, bottom: 24.h, left: 20.w, right: 20.w),
      constraints: BoxConstraints(maxHeight: 74.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RecetappButton(
            label: 'Cancelar',
            onPressed: onCancelPressed,
            optionalWidth: 169.w,
            variant: RecetappButtonVariant.negative,
          ),
          RecetappButton(label: 'Aceptar', onPressed: onAcceptPressed, optionalWidth: 169.w),
        ],
      ),
    );
  }
}
