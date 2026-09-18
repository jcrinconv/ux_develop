import 'package:flutter/material.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

/// Fila/tarjeta de perfil (persona o mascota) con nombre, subtítulo y chevron.
/// [selected] la muestra rellena en verde (perfil activo).
class RecetappProfileRow extends StatelessWidget {
  const RecetappProfileRow({super.key, required this.name, required this.subtitle, this.selected = false, this.onTap});

  final String name;
  final String subtitle;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Color nameColor = selected ? RecetappThemeColors.onPrimary : RecetappThemeColors.textPrimary;
    final Color subtitleColor = selected ? RecetappThemeColors.onPrimary.withValues(alpha: 0.85) : RecetappThemeColors.darkGreen.withValues(alpha: 0.5);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: selected ? RecetappThemeColors.primary : Colors.white,
          border: Border.all(color: selected ? RecetappThemeColors.primary : RecetappThemeColors.mint),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: RecetappTextStyles.body1Bold.copyWith(color: nameColor)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: RecetappTextStyles.body2.copyWith(color: subtitleColor)),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: nameColor),
          ],
        ),
      ),
    );
  }
}
