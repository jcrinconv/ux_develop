import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

final ColorScheme _recetappColorScheme = ColorScheme.fromSeed(
  seedColor: RecetappThemeColors.primary,
  brightness: Brightness.light,
  primary: RecetappThemeColors.primary,
  onPrimary: RecetappThemeColors.onPrimary,
  secondary: RecetappThemeColors.accent,
  onSecondary: RecetappThemeColors.onPrimary,
  error: RecetappThemeColors.error,
  onError: RecetappThemeColors.onPrimary,
  surface: Colors.white,
  onSurface: RecetappThemeColors.textPrimary,
);

final TextTheme _recetappTextTheme = TextTheme(
  displayLarge: RecetappTextStyles.h1,
  headlineLarge: RecetappTextStyles.h1,
  headlineMedium: RecetappTextStyles.h2,
  titleLarge: RecetappTextStyles.h3Bold,
  titleMedium: RecetappTextStyles.h3,
  titleSmall: RecetappTextStyles.formLabel,
  bodyLarge: RecetappTextStyles.body1,
  bodyMedium: RecetappTextStyles.body2,
  bodySmall: RecetappTextStyles.hint,
  labelLarge: RecetappTextStyles.labelButtonTab,
  labelMedium: RecetappTextStyles.formLabel,
  labelSmall: RecetappTextStyles.hint,
);

final OutlineInputBorder _inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide(color: RecetappThemeColors.darkGreen.withValues(alpha: 0.2)),
);

ThemeData recetappTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: RecetappThemeColors.background,
  primaryColor: RecetappThemeColors.primary,
  colorScheme: _recetappColorScheme,
  textTheme: GoogleFonts.atkinsonHyperlegibleTextTheme().merge(_recetappTextTheme),
  fontFamily: GoogleFonts.atkinsonHyperlegible().fontFamily,

  appBarTheme: AppBarTheme(
    backgroundColor: RecetappThemeColors.background,
    foregroundColor: RecetappThemeColors.textPrimary,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: RecetappTextStyles.h2,
    iconTheme: const IconThemeData(color: RecetappThemeColors.textPrimary),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: RecetappThemeColors.primary,
      foregroundColor: RecetappThemeColors.onPrimary,
      disabledBackgroundColor: RecetappThemeColors.darkGreen.withValues(alpha: 0.12),
      disabledForegroundColor: RecetappThemeColors.darkGreen.withValues(alpha: 0.38),
      textStyle: RecetappTextStyles.labelButtonTab,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      elevation: 0,
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: RecetappThemeColors.primary,
      disabledForegroundColor: RecetappThemeColors.darkGreen.withValues(alpha: 0.38),
      textStyle: RecetappTextStyles.labelButtonTab,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      side: const BorderSide(color: RecetappThemeColors.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: RecetappThemeColors.primary, textStyle: RecetappTextStyles.labelButtonTab),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    labelStyle: RecetappTextStyles.formLabel,
    hintStyle: RecetappTextStyles.hint,
    errorStyle: RecetappTextStyles.body2.copyWith(color: RecetappThemeColors.error),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: _inputBorder,
    enabledBorder: _inputBorder,
    focusedBorder: _inputBorder.copyWith(borderSide: const BorderSide(color: RecetappThemeColors.primary, width: 2)),
    errorBorder: _inputBorder.copyWith(borderSide: const BorderSide(color: RecetappThemeColors.error)),
    focusedErrorBorder: _inputBorder.copyWith(borderSide: const BorderSide(color: RecetappThemeColors.error, width: 2)),
  ),

  tabBarTheme: TabBarThemeData(
    labelColor: RecetappThemeColors.primary,
    unselectedLabelColor: RecetappThemeColors.darkGreen.withValues(alpha: 0.5),
    labelStyle: RecetappTextStyles.labelButtonTab,
    unselectedLabelStyle: RecetappTextStyles.labelButtonTab,
    indicatorColor: RecetappThemeColors.primary,
    indicatorSize: TabBarIndicatorSize.label,
  ),

  dialogTheme: DialogThemeData(
    backgroundColor: Colors.white,
    titleTextStyle: RecetappTextStyles.h3Bold,
    contentTextStyle: RecetappTextStyles.body2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  snackBarTheme: SnackBarThemeData(
    backgroundColor: RecetappThemeColors.peach,
    contentTextStyle: RecetappTextStyles.body2.copyWith(color: RecetappThemeColors.textPrimary),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),

  dividerColor: RecetappThemeColors.darkGreen.withValues(alpha: 0.1),
);
