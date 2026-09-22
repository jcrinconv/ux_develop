import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

/// Barra superior principal: selector de perfil (píldora verde) + campana de
/// notificaciones.
class RecetappHomeTopBar extends StatelessWidget implements PreferredSizeWidget {
  const RecetappHomeTopBar({
    super.key,
    required this.profileName,
    this.onProfileTap,
    this.onNotificationsTap,
    this.hasNotification = false,
  });

  final String profileName;
  final VoidCallback? onProfileTap;
  final VoidCallback? onNotificationsTap;
  final bool hasNotification;

  @override
  Size get preferredSize => Size.fromHeight(72.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12.h, bottom: 14.h),
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: RecetappThemeColors.darkGreen.withValues(alpha: 0.1))),
      ),
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: SizedBox(
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 36.w),
                    Center(
                      child: InkWell(
                        onTap: onProfileTap,
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          width: 174.w,
                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: RecetappThemeColors.primary,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                profileName,
                                style: RecetappTextStyles.formLabel.copyWith(color: RecetappThemeColors.onPrimary),
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded, color: RecetappThemeColors.onPrimary),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Stack(
                      fit: StackFit.loose,
                      children: [
                        MaterialButton(
                          onPressed: onNotificationsTap,
                          height: 36.h,
                          minWidth: 36.w,
                          padding: EdgeInsets.all(0),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          child: Icon(Icons.notifications_outlined, color: RecetappThemeColors.primary, size: 36.w),
                        ),
                        if (hasNotification)
                          Positioned(
                            right: 10.w,
                            top: 10.h,
                            child: Container(
                              width: 8.w,
                              height: 8.h,
                              decoration: const BoxDecoration(color: RecetappThemeColors.accent, shape: BoxShape.circle),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
