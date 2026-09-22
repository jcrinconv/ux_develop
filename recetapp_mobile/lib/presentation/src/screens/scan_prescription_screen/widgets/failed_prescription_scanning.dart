import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recetapp_mobile/dependencies_injection/locator.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

Future<void> showFailedPrescriptionScanning() async {
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
            constraints: BoxConstraints(minWidth: 320.w),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(RecetappIcons.unsuccessIcon, height: 50.h),
                ),
                SizedBox(height: 16.h),
                Text('No pudimos escanear tu receta', style: RecetappTextStyles.formLabel),
                SizedBox(height: 16.h),
                Text(
                  'La imagen no se leyó correctamente. Intenta con mejor luz o ingresa los datos manualmente.',
                  style: RecetappTextStyles.body2,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecetappButton(
                      label: 'Ingreso manual',
                      onPressed: () {
                        navigationService.goBack();
                        navigationService.navigateToNamedRemoveCurrent(prescriptionDetailsScreenRoute);
                      },
                      variant: RecetappButtonVariant.text,
                    ),
                    RecetappButton(label: 'Reintentar', onPressed: () => navigationService.goBack()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
