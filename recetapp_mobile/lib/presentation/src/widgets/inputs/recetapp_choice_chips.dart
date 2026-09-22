import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

/// Grupo de opciones tipo "chip" de selección única (ej. Hoy / Mañana / fecha).
class RecetappChoiceChips extends StatelessWidget {
  const RecetappChoiceChips({super.key, this.label, required this.options, required this.selected, required this.onChanged});

  final String? label;
  final List<String> options;
  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[Text(label!, style: RecetappTextStyles.formLabel), SizedBox(height: 4.h)],
        Wrap(
          spacing: 10.w,
          runSpacing: 10.w,
          children: [
            for (final option in options)
              _RecetappChoiceChip(label: option, isSelected: option == selected, onTap: () => onChanged(option)),
          ],
        ),
      ],
    );
  }
}

class _RecetappChoiceChip extends StatelessWidget {
  const _RecetappChoiceChip({required this.label, required this.isSelected, required this.onTap});

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? RecetappThemeColors.primary : Colors.white,
          border: Border.all(color: RecetappThemeColors.primary),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          label,
          style: RecetappTextStyles.body1Bold.copyWith(
            color: isSelected ? RecetappThemeColors.onPrimary : RecetappThemeColors.primary,
          ),
        ),
      ),
    );
  }
}
