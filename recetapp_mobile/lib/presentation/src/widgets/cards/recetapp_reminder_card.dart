import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

class RecetappReminderCard extends StatelessWidget {
  const RecetappReminderCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPostpone,
    required this.onTaken,
  });

  final String title;
  final String subtitle;
  final VoidCallback onPostpone;
  final VoidCallback onTaken;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(color: RecetappThemeColors.background, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(color: RecetappThemeColors.primary, borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              children: [
                const RecetappStrokeIcon(
                  asset: RecetappIcons.bellIcon,
                  width: 15,
                  height: 13.25,
                  bleed: Offset(0.75, 0.75),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: RecetappTextStyles.formLabel.copyWith(color: RecetappThemeColors.onPrimary)),
                      SizedBox(height: 2.h),
                      Text(subtitle, style: RecetappTextStyles.body2.copyWith(color: RecetappThemeColors.onPrimary)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.h),
          Row(
            children: [
              Expanded(
                child: RecetappButton(
                  label: 'Posponer',
                  onPressed: onPostpone,
                  variant: RecetappButtonVariant.text,
                  color: RecetappThemeColors.accent,
                  optionalWidth: double.infinity,
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: RecetappButton(label: 'Ya la tomé', onPressed: onTaken, optionalWidth: double.infinity),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
