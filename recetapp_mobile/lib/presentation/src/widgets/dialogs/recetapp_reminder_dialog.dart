import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

Future<void> showReminderDialog(
  BuildContext context, {
  required String title,
  required String subtitle,
  VoidCallback? onPostpone,
  VoidCallback? onTaken,
}) {
  return showDialog<void>(
    context: context,
    barrierColor: recetappScrimColor,
    builder: (dialogContext) {
      void close(VoidCallback? action) {
        Navigator.of(dialogContext).pop();
        action?.call();
      }

      return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.paddingOf(dialogContext).top + 57.h, left: 20.w, right: 20.w),
          child: Material(
            type: MaterialType.transparency,
            child: RecetappReminderCard(
              title: title,
              subtitle: subtitle,
              onPostpone: () => close(onPostpone),
              onTaken: () => close(onTaken),
            ),
          ),
        ),
      );
    },
  );
}
