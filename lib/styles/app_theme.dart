// lib/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    // Define the light theme
    return ThemeData(
      primarySwatch: Colors.blue,
      // Use white as the background color for widgets like Scaffold
      scaffoldBackgroundColor: Colors.white,
      // Use white as the canvas color (default background color of Material)
      canvasColor: Colors.white,
      // Define the default brightness and colors.
      colorScheme: const ColorScheme.light(
        primary:
            Colors.blue, // Color of the app bar and other primary UI elements
        onPrimary: Colors.white, // Text color on top of primary color
        secondary: Colors
            .blueAccent, // Accent color for buttons and interactive elements
        onSecondary: Colors.white, // Text color on top of accent color
        surface: Colors.white, // Background color for cards and sheets
        onSurface: Colors.black, // Text color on top of surface colors
        background:
            Colors.white, // Background color for larger parts of the app
        onBackground: Colors.black, // Text color on top of background colors
      ),
      // Apply a text theme that uses black for text for better contrast on light backgrounds
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        displayLarge: TextStyle(color: Colors.black),
        displayMedium: TextStyle(color: Colors.black),
        // Add other text styles as needed
      ),
      // Elevated button theme with blue background and white text
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Background color
          foregroundColor: Colors.white, // Text color
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue, // Color of the selected item
        unselectedItemColor: Colors.grey, // Color of the unselected items
        backgroundColor:
            Colors.white, // Background color of the bottom navigation bar
      ),
    );
  }

  // You can also define a dark theme or other custom themes here
}
