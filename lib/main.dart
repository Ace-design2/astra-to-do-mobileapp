import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/main_layout.dart';

void main() {
  runApp(const AstraToDoApp());
}

class AstraToDoApp extends StatelessWidget {
  const AstraToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a premium red accent color
    const Color accentRed = Color(0xFFC1121F);

    return MaterialApp(
      title: 'Astra To-Do',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // Respect system theme
      theme: _buildTheme(Brightness.light, accentRed),
      darkTheme: _buildTheme(Brightness.dark, accentRed),
      home: const MainLayout(),
    );
  }

  ThemeData _buildTheme(Brightness brightness, Color accentColor) {
    final baseTheme = ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorSchemeSeed: accentColor,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme).copyWith(
        displayLarge: GoogleFonts.outfit(
          textStyle: baseTheme.textTheme.displayLarge,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.outfit(
          textStyle: baseTheme.textTheme.displayMedium,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: GoogleFonts.outfit(
          textStyle: baseTheme.textTheme.displaySmall,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: GoogleFonts.outfit(
          textStyle: baseTheme.textTheme.headlineLarge,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: GoogleFonts.outfit(
          textStyle: baseTheme.textTheme.headlineMedium,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.outfit(
          textStyle: baseTheme.textTheme.titleLarge,
          fontWeight: FontWeight.w600,
        ),
      ),
      scaffoldBackgroundColor: brightness == Brightness.dark
          ? const Color(0xFF000000) // Pure black for deep dark mode
          : const Color(0xFFF8F9FA), // Clean, light off-white
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: brightness == Brightness.dark ? Colors.white : Colors.black87,
        ),
        titleTextStyle: GoogleFonts.outfit(
          color: brightness == Brightness.dark ? Colors.white : Colors.black87,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(
            color: Color(
              0x0C000000,
            ), // Very light border to match both themes roughly, or we can use custom theme extension later. Let's just use basic border.
            width: 1,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: brightness == Brightness.dark
            ? const Color(0xFF1A1A20)
            : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: brightness == Brightness.dark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.05),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: accentColor.withValues(alpha: 0.5),
            width: 1.5,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
    );
  }
}
