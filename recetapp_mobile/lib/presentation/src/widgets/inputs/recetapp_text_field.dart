import 'package:flutter/material.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

/// Campo de texto con etiqueta, y opcionalmente una leyenda a la derecha
/// (unidad, ej. "Pastillas") y un texto de error debajo.
class RecetappTextField extends StatelessWidget {
  const RecetappTextField({
    super.key,
    required this.label,
    this.controller,
    this.hintText,
    this.caption,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.onChanged,
    this.onTap,
    this.suffixIcon,
  });

  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final String? caption;
  final String? errorText;
  final bool enabled;
  final bool readOnly;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final Widget? suffixIcon;

  bool get _hasError => errorText != null && errorText!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = _hasError ? RecetappThemeColors.error : RecetappThemeColors.mint;
    final OutlineInputBorder border = OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: borderColor));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: RecetappTextStyles.formLabel),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                enabled: enabled,
                readOnly: readOnly,
                keyboardType: keyboardType,
                onChanged: onChanged,
                onTap: onTap,
                style: RecetappTextStyles.body1,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: RecetappTextStyles.body1.copyWith(color: RecetappThemeColors.darkGreen.withValues(alpha: 0.35)),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: suffixIcon,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: border,
                  enabledBorder: border,
                  disabledBorder: border,
                  focusedBorder: border.copyWith(borderSide: BorderSide(color: _hasError ? RecetappThemeColors.error : RecetappThemeColors.primary, width: 2)),
                ),
              ),
            ),
            if (caption != null) ...[
              const SizedBox(width: 12),
              Text(caption!, style: RecetappTextStyles.body2.copyWith(color: RecetappThemeColors.darkGreen.withValues(alpha: 0.6))),
            ],
          ],
        ),
        if (_hasError) ...[
          const SizedBox(height: 4),
          Text(errorText!, style: RecetappTextStyles.body2.copyWith(color: RecetappThemeColors.error)),
        ],
      ],
    );
  }
}
