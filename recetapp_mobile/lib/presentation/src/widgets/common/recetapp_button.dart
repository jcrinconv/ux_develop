import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

enum RecetappButtonVariant { primary, dark, outlined, text, negative }

class RecetappButton extends StatelessWidget {
  const RecetappButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = RecetappButtonVariant.primary,
    this.icon,
    this.color,
    this.optionalWidth,
  });

  final String label;
  final VoidCallback? onPressed;
  final RecetappButtonVariant variant;
  final IconData? icon;
  final Color? color;
  final double? optionalWidth;

  Color get _baseColor =>
      color ?? (variant == RecetappButtonVariant.dark ? RecetappThemeColors.darkGreen : RecetappThemeColors.primary);

  @override
  Widget build(BuildContext context) {
    final Widget label0 = Text(label.toUpperCase());
    final Widget child = icon == null
        ? label0
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18.w),
              SizedBox(width: 8.w),
              label0,
            ],
          );

    BorderRadius radius = BorderRadius.all(Radius.circular(8.r));
    EdgeInsets padding = EdgeInsets.symmetric(horizontal: 19.w, vertical: 8.h);
    final bool enabled = onPressed != null;

    final Widget button = switch (variant) {
      RecetappButtonVariant.outlined => OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: _baseColor,
          disabledForegroundColor: RecetappThemeColors.mint,
          side: BorderSide(color: enabled ? _baseColor : RecetappThemeColors.mint, width: 1.5.w),
          textStyle: RecetappTextStyles.labelButtonTab,
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
        child: child,
      ),
      RecetappButtonVariant.text => TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: _baseColor,
          disabledForegroundColor: RecetappThemeColors.mint,
          textStyle: RecetappTextStyles.labelButtonTab,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        ),
        child: child,
      ),
      RecetappButtonVariant.primary || RecetappButtonVariant.dark => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _baseColor,
          foregroundColor: RecetappThemeColors.onPrimary,
          disabledBackgroundColor: Colors.white,
          disabledForegroundColor: RecetappThemeColors.mint,
          side: BorderSide(color: enabled ? Colors.transparent : RecetappThemeColors.mint),
          textStyle: RecetappTextStyles.labelButtonTab,
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: radius),
          elevation: 0,
        ),
        child: child,
      ),
      RecetappButtonVariant.negative => OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: RecetappThemeColors.accent,
          disabledForegroundColor: RecetappThemeColors.peach,
          side: BorderSide(color: enabled ? RecetappThemeColors.accent : RecetappThemeColors.peach, width: 1.5.w),
          textStyle: RecetappTextStyles.labelButtonTab,
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
        child: child,
      ),
    };

    return optionalWidth != null ? SizedBox(width: optionalWidth, child: button) : button;
  }
}
