import 'package:flutter/material.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

/// Selector de ancho completo: etiqueta arriba + [RecetappDropdownField].
class RecetappSelectField extends StatelessWidget {
  const RecetappSelectField({super.key, required this.label, required this.value, required this.options, required this.onChanged});

  final String label;
  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: RecetappTextStyles.formLabel),
        const SizedBox(height: 8),
        RecetappDropdownField(
          value: value,
          options: options,
          onChanged: onChanged,
          width: double.infinity,
          textStyle: RecetappTextStyles.body1.copyWith(color: RecetappThemeColors.textPrimary),
        ),
      ],
    );
  }
}
