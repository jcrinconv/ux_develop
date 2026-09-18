import 'package:flutter/material.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

enum RecetappFabVariant { primary, dark }

class RecetappFab extends StatelessWidget {
  const RecetappFab({
    super.key,
    required this.onPressed,
    this.icon = Icons.add_rounded,
    this.variant = RecetappFabVariant.primary,
    this.size = 56,
    this.iconSize = 24,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final RecetappFabVariant variant;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final Color color = variant == RecetappFabVariant.dark ? RecetappThemeColors.darkGreen : RecetappThemeColors.primary;
    return SizedBox(
      width: size,
      height: size,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: color,
        foregroundColor: RecetappThemeColors.onPrimary,
        elevation: 0,
        shape: CircleBorder(),
        child: Icon(icon, size: iconSize),
      ),
    );
  }
}
