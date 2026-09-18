import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

class RecetappBottomNavItemData {
  const RecetappBottomNavItemData({required this.iconPath, required this.label});

  final String iconPath;
  final String label;
}

/// Barra de navegación inferior con ítems ícono + etiqueta.
class RecetappBottomNav extends StatelessWidget {
  const RecetappBottomNav({super.key, required this.items, required this.currentIndex, required this.onTap});

  final List<RecetappBottomNavItemData> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: RecetappThemeColors.darkGreen.withValues(alpha: 0.1))),
      ),
      padding: EdgeInsets.symmetric(vertical: 22.h),
      constraints: BoxConstraints(maxHeight: 84.h),
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Row(
          children: [
            for (int i = 0; i < items.length; i++)
              Expanded(
                child: InkWell(
                  onTap: () => onTap(i),
                  child: _RecetappNavItem(data: items[i], isActive: i == currentIndex),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _RecetappNavItem extends StatelessWidget {
  const _RecetappNavItem({required this.data, required this.isActive});

  final RecetappBottomNavItemData data;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final Color color = isActive ? RecetappThemeColors.primary : RecetappThemeColors.darkGreen.withValues(alpha: 0.4);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(data.iconPath, width: 20.w, height: 20.h, colorFilter: ColorFilter.mode(color, BlendMode.srcIn)),
        Text(data.label, style: RecetappTextStyles.body2Bold.copyWith(color: color)),
      ],
    );
  }
}
