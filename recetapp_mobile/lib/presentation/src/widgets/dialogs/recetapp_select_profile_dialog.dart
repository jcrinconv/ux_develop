import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

class RecetappProfileOption {
  const RecetappProfileOption({required this.name, required this.subtitle});

  final String name;
  final String subtitle;
}

Future<RecetappProfileOption?> showSelectProfileDialog(
  BuildContext context, {
  required List<RecetappProfileOption> profiles,
  required String selectedName,
  VoidCallback? onAddProfile,
}) {
  return showDialog<RecetappProfileOption>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.45),
    builder: (context) =>
        RecetappSelectProfileDialog(profiles: profiles, selectedName: selectedName, onAddProfile: onAddProfile),
  );
}

class RecetappSelectProfileDialog extends StatelessWidget {
  const RecetappSelectProfileDialog({super.key, required this.profiles, required this.selectedName, this.onAddProfile});

  final List<RecetappProfileOption> profiles;
  final String selectedName;
  final VoidCallback? onAddProfile;

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
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(onClose: () => Navigator.of(context).pop()),
              SizedBox(height: 16.h),
              for (int i = 0; i < profiles.length; i++) ...[
                if (i > 0) SizedBox(height: 10.h),
                RecetappProfileRow(
                  name: profiles[i].name,
                  subtitle: profiles[i].subtitle,
                  selected: profiles[i].name == selectedName,
                  onTap: () => Navigator.of(context).pop(profiles[i]),
                ),
              ],
              SizedBox(height: 16.h),
              _AddProfileButton(onTap: onAddProfile),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            'Seleccionar perfil',
            style: RecetappTextStyles.formLabel.copyWith(color: RecetappThemeColors.darkGreen),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onClose,
          child: Padding(
            padding: EdgeInsets.only(left: 12.w, bottom: 9.h),
            child: const RecetappStrokeIcon(
              asset: RecetappIcons.closeIcon,
              width: 11,
              height: 11,
              bleed: Offset(0.75, 0.75),
            ),
          ),
        ),
      ],
    );
  }
}

class _AddProfileButton extends StatelessWidget {
  const _AddProfileButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RecetappDashedBorder(
      color: RecetappThemeColors.mint,
      radius: 8.r,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const RecetappStrokeIcon(asset: RecetappIcons.plusIcon, width: 12, height: 12, bleed: Offset(0.75, 0.75)),
              SizedBox(width: 8.w),
              Text('Agregar perfil', style: RecetappTextStyles.body2.copyWith(color: RecetappThemeColors.doveGray)),
            ],
          ),
        ),
      ),
    );
  }
}
