import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recetapp_mobile/dependencies_injection/locator.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

Future<void> showPrescriptionCreatedDialog() async {
  final NavigationService navigationService = locator<NavigationService>();

  if (navigationService.state != null) {
    return await showDialog(
      barrierColor: Colors.black.withValues(alpha: 0.6),
      context: navigationService.state!.context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Dialog(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(RecetappIcons.successIcon, height: 50.h),
                ),
                SizedBox(height: 16.h),
                Text('¡Alarma creada exitosamente!', style: RecetappTextStyles.formLabel),
                SizedBox(height: 16.h),
                Text(
                  'La alarma para tu receta médica quedó activa. Te avisaremos en cada toma.',
                  style: RecetappTextStyles.body2,
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: RecetappButton(
                    label: 'Aceptar',
                    onPressed: () => navigationService.navigateToNamedRouteNoBackStack(homeScreenRoute),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
