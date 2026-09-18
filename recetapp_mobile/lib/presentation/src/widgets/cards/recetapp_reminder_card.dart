import 'package:flutter/material.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

/// Aviso de recordatorio de medicamento: banner verde con campana, título y
/// subtítulo, más las acciones "Posponer" / "Ya la tomé".
class RecetappReminderCard extends StatelessWidget {
  const RecetappReminderCard({super.key, required this.title, required this.subtitle, required this.onPostpone, required this.onTaken});

  final String title;
  final String subtitle;
  final VoidCallback onPostpone;
  final VoidCallback onTaken;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: RecetappThemeColors.background, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: RecetappThemeColors.primary, borderRadius: BorderRadius.circular(16)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.notifications_outlined, color: RecetappThemeColors.onPrimary, size: 28),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: RecetappTextStyles.h3Bold.copyWith(color: RecetappThemeColors.onPrimary)),
                      const SizedBox(height: 4),
                      Text(subtitle, style: RecetappTextStyles.body1.copyWith(color: RecetappThemeColors.onPrimary)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RecetappButton(label: 'Posponer', onPressed: onPostpone, variant: RecetappButtonVariant.text, color: RecetappThemeColors.accent),
              RecetappButton(label: 'Ya la tomé', onPressed: onTaken, variant: RecetappButtonVariant.primary),
            ],
          ),
        ],
      ),
    );
  }
}
