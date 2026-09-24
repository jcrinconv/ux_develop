import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recetapp_mobile/dependencies_injection/locator.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

Future<void> showPrescriptionCreatedDialog() async {
  final NavigationService navigationService = locator<NavigationService>();

  if (navigationService.state != null) {
    return await showDialog(
      barrierColor: recetappScrimColor,
      context: navigationService.state!.context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: RecetappModal(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.center, child: SvgPicture.asset(RecetappIcons.successIcon)),
              SizedBox(height: 16.h),
              Text(
                '¡Alarma creada exitosamente!',
                style: RecetappTextStyles.formLabel.copyWith(color: RecetappThemeColors.darkGreen),
              ),
              SizedBox(height: 16.h),
              Text(
                'La alarma para tu receta médica quedó activa. Te avisaremos en cada toma.',
                style: RecetappTextStyles.body2.copyWith(color: RecetappThemeColors.doveGray),
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
    );
  }
}
