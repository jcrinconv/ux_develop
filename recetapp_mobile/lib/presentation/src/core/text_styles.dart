import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

abstract class RecetappTextStyles {
  static TextStyle _atkinson({
    required double fontSize,
    required double lineHeight,
    required FontWeight fontWeight,
    Color color = RecetappThemeColors.textPrimary,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.atkinsonHyperlegible(
      fontSize: fontSize,
      height: lineHeight / fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: decoration,
    );
  }

  /// H1: Título — Atkinson Normal 36/36
  static final TextStyle h1 = _atkinson(fontSize: 36.sp, lineHeight: 36.h, fontWeight: FontWeight.w400);

  /// H2: Subtítulo — Atkinson Normal 30/32
  static final TextStyle h2 = _atkinson(fontSize: 30.sp, lineHeight: 32.h, fontWeight: FontWeight.w400);

  /// H3: Sub - Heading — Atkinson Normal 20/22
  static final TextStyle h3 = _atkinson(fontSize: 20.sp, lineHeight: 22.h, fontWeight: FontWeight.w400);

  /// H3: Sub - Heading (Bold) — Atkinson Bold 20/22
  static final TextStyle h3Bold = _atkinson(fontSize: 20.sp, lineHeight: 22.h, fontWeight: FontWeight.bold);

  /// Body 1 — Atkinson Normal 16/20
  static final TextStyle body1 = _atkinson(fontSize: 16.sp, lineHeight: 20.h, fontWeight: FontWeight.w400);

  /// Body 1 (Bold) — Atkinson Bold 16/20
  static final TextStyle body1Bold = _atkinson(fontSize: 16.sp, lineHeight: 20.h, fontWeight: FontWeight.bold);

  /// Body 2 — Atkinson Normal 14/18
  static final TextStyle body2 = _atkinson(fontSize: 14.sp, lineHeight: 18.h, fontWeight: FontWeight.w400);

  /// Body 2 (Bold) — Atkinson Bold 14/18
  static final TextStyle body2Bold = _atkinson(fontSize: 14.sp, lineHeight: 18.h, fontWeight: FontWeight.bold);

  /// Label de botón y tabs — Atkinson Bold 14/18. Usar en mayúsculas (`text.toUpperCase()`).
  static final TextStyle labelButtonTab = _atkinson(fontSize: 14.sp, lineHeight: 18.h, fontWeight: FontWeight.bold);

  /// Form labels y headers de tabla — Atkinson Bold 16/20
  static final TextStyle formLabel = _atkinson(fontSize: 16.sp, lineHeight: 20.h, fontWeight: FontWeight.bold);

  /// Hint — Atkinson Normal 13/18
  static final TextStyle hint = _atkinson(
    fontSize: 13.sp,
    lineHeight: 18.h,
    fontWeight: FontWeight.w400,
    color: RecetappThemeColors.darkGreen.withValues(alpha: 0.6),
  );

  /// Link — Atkinson Normal 14/18, subrayado
  static final TextStyle link = _atkinson(
    fontSize: 14.sp,
    lineHeight: 18.h,
    fontWeight: FontWeight.w400,
    color: RecetappThemeColors.primary,
    decoration: TextDecoration.underline,
  );
}
