import 'package:flutter/material.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

enum RecetappButtonVariant { primary, dark, outlined, text }

class RecetappButton extends StatelessWidget {
  const RecetappButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = RecetappButtonVariant.primary,
    this.icon,
    this.color,
    this.fullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final RecetappButtonVariant variant;
  final IconData? icon;
  final Color? color;
  final bool fullWidth;

  Color get _baseColor => color ?? (variant == RecetappButtonVariant.dark ? RecetappThemeColors.darkGreen : RecetappThemeColors.primary);

  @override
  Widget build(BuildContext context) {
    final Widget label0 = Text(label.toUpperCase());
    final Widget child = icon == null
        ? label0
        : Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 18), const SizedBox(width: 8), label0]);

    const BorderRadius radius = BorderRadius.all(Radius.circular(28));
    const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 24, vertical: 14);
    final bool enabled = onPressed != null;

    final Widget button = switch (variant) {
      RecetappButtonVariant.outlined => OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: _baseColor,
          disabledForegroundColor: RecetappThemeColors.mint,
          side: BorderSide(color: enabled ? _baseColor : RecetappThemeColors.mint),
          textStyle: RecetappTextStyles.labelButtonTab,
          padding: padding,
          shape: const RoundedRectangleBorder(borderRadius: radius),
        ),
        child: child,
      ),
      RecetappButtonVariant.text => TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: _baseColor,
          disabledForegroundColor: RecetappThemeColors.mint,
          textStyle: RecetappTextStyles.labelButtonTab,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
          shape: const RoundedRectangleBorder(borderRadius: radius),
          elevation: 0,
        ),
        child: child,
      ),
    };

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
