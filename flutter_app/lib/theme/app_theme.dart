import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App color scheme matching the React design system.
/// Colors are defined in HSL and converted to Flutter Color.
class AppColors {
  // Light theme colors
  static const Color background = Color(0xFFF5F5F5); // hsl(0, 0%, 96%)
  static const Color foreground = Color(0xFF171717); // hsl(0, 0%, 9%)
  
  static const Color card = Color(0xFFFAFAFA); // hsl(0, 0%, 98%)
  static const Color cardForeground = Color(0xFF171717); // hsl(0, 0%, 9%)
  
  static const Color primary = Color(0xFF089968); // hsl(161, 93%, 30%)
  static const Color primaryForeground = Color(0xFFE8F8F3); // hsl(151, 80%, 95%)
  
  static const Color secondary = Color(0xFF525252); // hsl(0, 0%, 32%)
  static const Color secondaryForeground = Color(0xFFFAFAFA); // hsl(0, 0%, 98%)
  
  static const Color muted = Color(0xFFA1A1A1); // hsl(0, 0%, 63%)
  static const Color mutedForeground = Color(0xFF171717); // hsl(0, 0%, 9%)
  
  static const Color accent = Color(0xFFE8FAF7); // hsl(166, 76%, 96%)
  static const Color accentForeground = Color(0xFF14A085); // hsl(173, 80%, 40%)
  
  static const Color destructive = Color(0xFFDC2626); // hsl(0, 72%, 50%)
  static const Color destructiveForeground = Color(0xFFFEE2E2); // hsl(0, 85%, 97%)
  
  static const Color border = Color(0xFFD4D4D4); // hsl(0, 0%, 83%)
  static const Color input = Color(0xFFD4D4D4); // hsl(0, 0%, 83%)
  
  // Chart colors
  static const Color chart1 = Color(0xFF3DD598); // hsl(158, 64%, 51%)
  static const Color chart2 = Color(0xFF4ADE80); // hsl(141, 69%, 58%)
  static const Color chart3 = Color(0xFF2DD4BF); // hsl(172, 66%, 50%)
  static const Color chart4 = Color(0xFFA3E635); // hsl(82, 77%, 55%)
  static const Color chart5 = Color(0xFF737373); // hsl(0, 0%, 45%)

  // Dark theme colors
  static const Color darkBackground = Color(0xFF171717); // hsl(0, 0%, 9%)
  static const Color darkForeground = Color(0xFFFAFAFA); // hsl(0, 0%, 98%)
  
  static const Color darkCard = Color(0xFF242424); // hsl(0, 0%, 14%)
  static const Color darkCardForeground = Color(0xFFFAFAFA);
  
  static const Color darkPrimary = Color(0xFF3DD598); // hsl(158, 64%, 51%)
  static const Color darkPrimaryForeground = Color(0xFF052E22); // hsl(165, 91%, 9%)
  
  static const Color darkAccent = Color(0xFF0A2D26); // hsl(178, 84%, 10%)
  static const Color darkAccentForeground = Color(0xFF2DD4BF);
  
  static const Color darkBorder = Color(0xFF525252);
}

/// App theme configuration.
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.primaryForeground,
        secondary: AppColors.secondary,
        onSecondary: AppColors.secondaryForeground,
        surface: AppColors.card,
        onSurface: AppColors.foreground,
        error: AppColors.destructive,
        onError: AppColors.destructiveForeground,
      ),
      textTheme: GoogleFonts.workSansTextTheme().copyWith(
        displayLarge: GoogleFonts.workSans(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.foreground,
        ),
        displayMedium: GoogleFonts.workSans(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.foreground,
        ),
        headlineLarge: GoogleFonts.workSans(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.foreground,
        ),
        headlineMedium: GoogleFonts.workSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.foreground,
        ),
        titleLarge: GoogleFonts.workSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.foreground,
        ),
        titleMedium: GoogleFonts.workSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.foreground,
        ),
        titleSmall: GoogleFonts.workSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.foreground,
        ),
        bodyLarge: GoogleFonts.workSans(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.foreground,
        ),
        bodyMedium: GoogleFonts.workSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.foreground,
        ),
        bodySmall: GoogleFonts.workSans(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.mutedForeground,
        ),
        labelLarge: GoogleFonts.workSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.foreground,
        ),
        labelMedium: GoogleFonts.workSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.foreground,
        ),
        labelSmall: GoogleFonts.workSans(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColors.mutedForeground,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.card,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.primaryForeground,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.foreground,
          side: const BorderSide(color: AppColors.border),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.card,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.muted,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.foreground,
        elevation: 0,
        centerTitle: false,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.card;
          }
          return AppColors.card;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.input;
        }),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.muted,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimary,
        onPrimary: AppColors.darkPrimaryForeground,
        secondary: AppColors.secondary,
        onSecondary: AppColors.secondaryForeground,
        surface: AppColors.darkCard,
        onSurface: AppColors.darkForeground,
        error: AppColors.destructive,
        onError: AppColors.destructiveForeground,
      ),
      textTheme: GoogleFonts.workSansTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.workSans(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.darkForeground,
        ),
        displayMedium: GoogleFonts.workSans(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.darkForeground,
        ),
        headlineLarge: GoogleFonts.workSans(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.darkForeground,
        ),
        headlineMedium: GoogleFonts.workSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.darkForeground,
        ),
        titleLarge: GoogleFonts.workSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.darkForeground,
        ),
        titleMedium: GoogleFonts.workSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.darkForeground,
        ),
        titleSmall: GoogleFonts.workSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.darkForeground,
        ),
        bodyLarge: GoogleFonts.workSans(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.darkForeground,
        ),
        bodyMedium: GoogleFonts.workSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.darkForeground,
        ),
        bodySmall: GoogleFonts.workSans(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.muted,
        ),
        labelLarge: GoogleFonts.workSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.darkForeground,
        ),
        labelMedium: GoogleFonts.workSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.darkForeground,
        ),
        labelSmall: GoogleFonts.workSans(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColors.muted,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColors.darkCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.darkPrimary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkPrimary,
          foregroundColor: AppColors.darkPrimaryForeground,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.darkForeground,
          side: const BorderSide(color: AppColors.darkBorder),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkCard,
        selectedItemColor: AppColors.darkPrimary,
        unselectedItemColor: AppColors.muted,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkForeground,
        elevation: 0,
        centerTitle: false,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.darkBorder,
        thickness: 1,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.darkCard;
          }
          return AppColors.darkCard;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.darkPrimary;
          }
          return AppColors.darkBorder;
        }),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.darkPrimary,
        linearTrackColor: AppColors.muted,
      ),
    );
  }
}
