import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

final Color recetappScrimColor = Colors.black.withValues(alpha: 0.45);

class RecetappModal extends StatelessWidget {
  const RecetappModal({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
        side: BorderSide(color: RecetappThemeColors.grey300, width: 1.5),
      ),
      child: SizedBox(
        width: 320.w,
        child: Padding(padding: EdgeInsets.all(20.w), child: child),
      ),
    );
  }
}
