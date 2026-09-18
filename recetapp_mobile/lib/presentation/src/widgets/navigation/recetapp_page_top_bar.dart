import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

/// Barra superior secundaria: flecha atrás + título de la pantalla.
class RecetappPageTopBar extends StatelessWidget implements PreferredSizeWidget {
  const RecetappPageTopBar({super.key, required this.title, this.onBack});

  final String title;
  final VoidCallback? onBack;

  @override
  Size get preferredSize => const Size.fromHeight(56);

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
              MaterialButton(
                onPressed: onBack ?? () => Navigator.of(context).maybePop(),
                padding: EdgeInsets.all(0),
                minWidth: 0,
                height: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                child: Icon(Icons.chevron_left, color: RecetappThemeColors.primary, size: 24.w),
              ),
              SizedBox(width: 5.w),
              Text(title, style: RecetappTextStyles.labelButtonTab.copyWith(color: RecetappThemeColors.primary)),
            ],
          ),
        ),
      ),
    );
  }
}
