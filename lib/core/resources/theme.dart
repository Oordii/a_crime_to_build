import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get darkDetectiveTheme => ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212),
  primaryColor: const Color(0xFF8C735B),
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFF8C735B),
    secondary: const Color(0xFF3C3C3C),
    surface: const Color(0xFF1A1A1A),
    error: Colors.red.shade700,
  ),
  cardColor: const Color(0xFF222222),
  canvasColor: const Color(0xFF1C1C1C),
  dividerColor: Colors.grey.shade800,
  shadowColor: Colors.black54,
  snackBarTheme: SnackBarThemeData(
    backgroundColor: const Color(0xFF3C3C3C),
    closeIconColor: Colors.grey.shade400,
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.specialElite(
      fontSize: 32,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.specialElite(
      fontSize: 16,
      color: Colors.grey.shade300,
    ),
    bodyMedium: GoogleFonts.specialElite(
      fontSize: 14,
      color: Colors.grey.shade400,
    ),
    titleMedium: GoogleFonts.specialElite(
      fontSize: 18,
      color: const Color(0xFF8C735B),
    ),
    labelMedium: GoogleFonts.specialElite(
      fontSize: 12,
      color: Colors.grey.shade300,
    ),
    labelSmall: GoogleFonts.specialElite(
      fontSize: 12,
      color: Colors.red.shade700,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1A1A1A),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF2A2A2A),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.grey.shade600),
    labelStyle: TextStyle(color: Colors.grey.shade400),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF8C735B),
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: GoogleFonts.specialElite(fontSize: 16),
    ),
  ),
);
