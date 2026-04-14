import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color scaffoldBackground;
  final Color cardBackground;
  final Color secondaryText;
  final Color divider;
  final Color primaryText;
  final Color secondaryBackground;
  final Color border;
  final Color shadow;
  final Color sectionIcon;
  final Color sectionTitle;
  final Color miniTitle;
  final Color cardBorder;
  final Color keyValueKey;
  final Color keyValueValue;
  final Color disabledButton;
  final Color disabledButtonText;
  final Color buttonForeground;
  final Color error;
  final Color warning;
  final Color success;
  final Color info;
  final Color overlay;
  final Color activeIndicator;
  final Color inactiveIndicator;

  const AppColors({
    required this.primary,
    required this.scaffoldBackground,
    required this.cardBackground,
    required this.secondaryText,
    required this.divider,
    required this.primaryText,
    required this.secondaryBackground,
    required this.border,
    required this.shadow,
    required this.sectionIcon,
    required this.sectionTitle,
    required this.miniTitle,
    required this.cardBorder,
    required this.keyValueKey,
    required this.keyValueValue,
    required this.disabledButton,
    required this.disabledButtonText,
    required this.buttonForeground,
    required this.error,
    required this.warning,
    required this.success,
    required this.info,
    required this.overlay,
    required this.activeIndicator,
    required this.inactiveIndicator,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? scaffoldBackground,
    Color? cardBackground,
    Color? secondaryText,
    Color? divider,
    Color? primaryText,
    Color? secondaryBackground,
    Color? border,
    Color? shadow,
    Color? sectionIcon,
    Color? sectionTitle,
    Color? miniTitle,
    Color? cardBorder,
    Color? keyValueKey,
    Color? keyValueValue,
    Color? disabledButton,
    Color? disabledButtonText,
    Color? buttonForeground,
    Color? error,
    Color? warning,
    Color? success,
    Color? info,
    Color? overlay,
    Color? activeIndicator,
    Color? inactiveIndicator,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      cardBackground: cardBackground ?? this.cardBackground,
      secondaryText: secondaryText ?? this.secondaryText,
      divider: divider ?? this.divider,
      primaryText: primaryText ?? this.primaryText,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      border: border ?? this.border,
      shadow: shadow ?? this.shadow,
      sectionIcon: sectionIcon ?? this.sectionIcon,
      sectionTitle: sectionTitle ?? this.sectionTitle,
      miniTitle: miniTitle ?? this.miniTitle,
      cardBorder: cardBorder ?? this.cardBorder,
      keyValueKey: keyValueKey ?? this.keyValueKey,
      keyValueValue: keyValueValue ?? this.keyValueValue,
      disabledButton: disabledButton ?? this.disabledButton,
      disabledButtonText: disabledButtonText ?? this.disabledButtonText,
      buttonForeground: buttonForeground ?? this.buttonForeground,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      info: info ?? this.info,
      overlay: overlay ?? this.overlay,
      activeIndicator: activeIndicator ?? this.activeIndicator,
      inactiveIndicator: inactiveIndicator ?? this.inactiveIndicator,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      scaffoldBackground: Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryBackground: Color.lerp(secondaryBackground, other.secondaryBackground, t)!,
      border: Color.lerp(border, other.border, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      sectionIcon: Color.lerp(sectionIcon, other.sectionIcon, t)!,
      sectionTitle: Color.lerp(sectionTitle, other.sectionTitle, t)!,
      miniTitle: Color.lerp(miniTitle, other.miniTitle, t)!,
      cardBorder: Color.lerp(cardBorder, other.cardBorder, t)!,
      keyValueKey: Color.lerp(keyValueKey, other.keyValueKey, t)!,
      keyValueValue: Color.lerp(keyValueValue, other.keyValueValue, t)!,
      disabledButton: Color.lerp(disabledButton, other.disabledButton, t)!,
      disabledButtonText: Color.lerp(disabledButtonText, other.disabledButtonText, t)!,
      buttonForeground: Color.lerp(buttonForeground, other.buttonForeground, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
      info: Color.lerp(info, other.info, t)!,
      overlay: Color.lerp(overlay, other.overlay, t)!,
      activeIndicator: Color.lerp(activeIndicator, other.activeIndicator, t)!,
      inactiveIndicator: Color.lerp(inactiveIndicator, other.inactiveIndicator, t)!,
    );
  }
}

extension AppColorsExtension on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  extensions: <ThemeExtension<dynamic>>[
    const AppColors(
      primary: Color(0xFF00C853),
      scaffoldBackground: Color(0xFF0E0E10),
      cardBackground: Color(0xFF1A1A1E),
      secondaryText: Color(0xFF8E8E93),
      divider: Color(0xFF2C2C2E),
      primaryText: Colors.white,
      secondaryBackground: Color(0xFF0B0F14),
      border: Color(0xFF2C2C2E),
      shadow: Colors.black,
      sectionIcon: Color(0xFFB9C6FF),
      sectionTitle: Color(0xFFE6EAF0),
      miniTitle: Color(0xFFB8C4D0),
      cardBorder: Color(0xFF101722),
      keyValueKey: Color(0xFF9AA6B2),
      keyValueValue: Color(0xFFE6EAF0),
      disabledButton: Color(0xFF8E8E93),
      disabledButtonText: Color(0xFF6E6E73),
      buttonForeground: Colors.black,
      error: Colors.redAccent,
      warning: Colors.yellow,
      success: Color(0xFF3EB48C),
      info: Color(0xFFB9C6FF),
      overlay: Colors.black,
      activeIndicator: Color(0xFF3EB48C),
      inactiveIndicator: Color(0xFF8E8E93),
    ),
  ],
  scaffoldBackgroundColor: const Color(0xFF0E0E10),
  primaryColor: const Color(0xFF9DFF00),
  cardTheme: const CardThemeData(
    color: Color(0xFF1A1A1E),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    margin: EdgeInsets.zero,
  ),
  textTheme: GoogleFonts.oswaldTextTheme(
    const TextTheme(
      bodySmall: TextStyle(color: Color(0xFF8E8E93), fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 18),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
          final colors = const AppColors(
            primary: Color(0xFF9DFF00),
            scaffoldBackground: Color(0xFF0E0E10),
            cardBackground: Color(0xFF1A1A1E),
            secondaryText: Color(0xFF8E8E93),
            divider: Color(0xFF2C2C2E),
            primaryText: Colors.white,
            secondaryBackground: Color(0xFF0B0F14),
            border: Color(0xFF2C2C2E),
            shadow: Colors.black,
            sectionIcon: Color(0xFFB9C6FF),
            sectionTitle: Color(0xFFE6EAF0),
            miniTitle: Color(0xFFB8C4D0),
            cardBorder: Color(0xFF101722),
            keyValueKey: Color(0xFF9AA6B2),
            keyValueValue: Color(0xFFE6EAF0),
            disabledButton: Color(0xFF8E8E93),
            disabledButtonText: Color(0xFF6E6E73),
            buttonForeground: Colors.black,
            error: Colors.redAccent,
            warning: Colors.yellow,
            success: Color(0xFF3EB48C),
            info: Color(0xFFB9C6FF),
            overlay: Colors.black,
            activeIndicator: Color(0xFF3EB48C),
            inactiveIndicator: Color(0xFF8E8E93),
          );
          if (states.contains(WidgetState.disabled)) {
            return colors.disabledButton;
          }
          return colors.primary;
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
          final colors = const AppColors(
            primary: Color(0xFF00C853),
            scaffoldBackground: Color(0xFF0E0E10),
            cardBackground: Color(0xFF1A1A1E),
            secondaryText: Color(0xFF8E8E93),
            divider: Color(0xFF2C2C2E),
            primaryText: Colors.white,
            secondaryBackground: Color(0xFF0B0F14),
            border: Color(0xFF2C2C2E),
            shadow: Colors.black,
            sectionIcon: Color(0xFFB9C6FF),
            sectionTitle: Color(0xFFE6EAF0),
            miniTitle: Color(0xFFB8C4D0),
            cardBorder: Color(0xFF101722),
            keyValueKey: Color(0xFF9AA6B2),
            keyValueValue: Color(0xFFE6EAF0),
            disabledButton: Color(0xFF8E8E93),
            disabledButtonText: Color(0xFF6E6E73),
            buttonForeground: Colors.black,
            error: Colors.redAccent,
            warning: Colors.yellow,
            success: Color(0xFF3EB48C),
            info: Color(0xFFB9C6FF),
            overlay: Colors.black,
            activeIndicator: Color(0xFF3EB48C),
            inactiveIndicator: Color(0xFF8E8E93),
          );
          if (states.contains(WidgetState.disabled)) {
            return colors.disabledButtonText;
          }
          return colors.buttonForeground;
        },
      ),
      elevation: WidgetStateProperty.resolveWith<double>(
            (states) {
          if (states.contains(WidgetState.disabled)) {
            return 0;
          }
          return 4;
        },
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      ),
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF9DFF00),
    foregroundColor: Colors.black,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),

  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.white,
  ),

  iconTheme: const IconThemeData(color: Color(0xFF8E8E93), size: 24),

  dividerTheme: const DividerThemeData(color: Color(0xFF2C2C2E), thickness: 1),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1A1A1E),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFF9DFF00)),
    ),
    hintStyle: const TextStyle(color: Color(0xFF8E8E93), fontSize: 14),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0E0E10),
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  ),
);




final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: <ThemeExtension<dynamic>>[
    const AppColors(
      primary: Color(0xFF9DFF00),
      scaffoldBackground: Color(0xFFFFFFFF),
      cardBackground: Colors.white,
      secondaryText: Color(0xFF6E6E73),
      divider: Color(0xFFD1D1D6),
      primaryText: Colors.black,
      secondaryBackground: Color(0xFFFAFAFA),
      border: Color(0xFFD1D1D6),
      shadow: Colors.black,
      sectionIcon: Color(0xFF6E6E73),
      sectionTitle: Color(0xFF1A1A1A),
      miniTitle: Color(0xFF6E6E73),
      cardBorder: Color(0xFFD1D1D6),
      keyValueKey: Color(0xFF6E6E73),
      keyValueValue: Color(0xFF1A1A1A),
      disabledButton: Color(0xFFE5E5EA),
      disabledButtonText: Color(0xFF8E8E93),
      buttonForeground: Colors.black,
      error: Colors.redAccent,
      warning: Colors.orange,
      success: Color(0xFF3EB48C),
      info: Color(0xFF6E6E73),
      overlay: Colors.black,
      activeIndicator: Color(0xFF3EB48C),
      inactiveIndicator: Color(0xFFD1D1D6),
    ),
  ],
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  primaryColor: const Color(0xFF9DFF00),

  cardTheme: const CardThemeData(
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    margin: EdgeInsets.zero,
  ),

  textTheme: GoogleFonts.oswaldTextTheme(
    const TextTheme(
      bodySmall: TextStyle(color: Color(0xFF6E6E73), fontSize: 14),
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
          final colors = const AppColors(
            primary: Color(0xFF9DFF00),
            scaffoldBackground: Color(0xFFFFFFFF),
            cardBackground: Colors.white,
            secondaryText: Color(0xFF6E6E73),
            divider: Color(0xFFD1D1D6),
            primaryText: Colors.black,
            secondaryBackground: Color(0xFFFAFAFA),
            border: Color(0xFFD1D1D6),
            shadow: Colors.black,
            sectionIcon: Color(0xFF6E6E73),
            sectionTitle: Color(0xFF1A1A1A),
            miniTitle: Color(0xFF6E6E73),
            cardBorder: Color(0xFFD1D1D6),
            keyValueKey: Color(0xFF6E6E73),
            keyValueValue: Color(0xFF1A1A1A),
            disabledButton: Color(0xFFE5E5EA),
            disabledButtonText: Color(0xFF8E8E93),
            buttonForeground: Colors.black,
            error: Colors.redAccent,
            warning: Colors.orange,
            success: Color(0xFF3EB48C),
            info: Color(0xFF6E6E73),
            overlay: Colors.black,
            activeIndicator: Color(0xFF3EB48C),
            inactiveIndicator: Color(0xFFD1D1D6),
          );
          if (states.contains(WidgetState.disabled)) {
            return colors.disabledButton;
          }
          return colors.primary;
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
          final colors = const AppColors(
            primary: Color(0xFF9DFF00),
            scaffoldBackground: Color(0xFFFFFFFF),
            cardBackground: Colors.white,
            secondaryText: Color(0xFF6E6E73),
            divider: Color(0xFFD1D1D6),
            primaryText: Colors.black,
            secondaryBackground: Color(0xFFFAFAFA),
            border: Color(0xFFD1D1D6),
            shadow: Colors.black,
            sectionIcon: Color(0xFF6E6E73),
            sectionTitle: Color(0xFF1A1A1A),
            miniTitle: Color(0xFF6E6E73),
            cardBorder: Color(0xFFD1D1D6),
            keyValueKey: Color(0xFF6E6E73),
            keyValueValue: Color(0xFF1A1A1A),
            disabledButton: Color(0xFFE5E5EA),
            disabledButtonText: Color(0xFF8E8E93),
            buttonForeground: Colors.black,
            error: Colors.redAccent,
            warning: Colors.orange,
            success: Color(0xFF3EB48C),
            info: Color(0xFF6E6E73),
            overlay: Colors.black,
            activeIndicator: Color(0xFF3EB48C),
            inactiveIndicator: Color(0xFFD1D1D6),
          );
          if (states.contains(WidgetState.disabled)) {
            return colors.disabledButtonText;
          }
          return colors.buttonForeground;
        },
      ),
      elevation: WidgetStateProperty.resolveWith<double>(
            (states) {
          if (states.contains(WidgetState.disabled)) {
            return 0;
          }
          return 2;
        },
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      ),
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF9DFF00),
    foregroundColor: Colors.black,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),

  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.white,
  ),

  iconTheme: const IconThemeData(
    color: Color(0xFF6E6E73),
    size: 24,
  ),

  dividerTheme: const DividerThemeData(
    color: Color(0xFFD1D1D6),
    thickness: 1,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFFD1D1D6)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFF9DFF00)),
    ),
    hintStyle: const TextStyle(
      color: Color(0xFF6E6E73),
      fontSize: 14,
    ),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFFFFFF),
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  ),
);
