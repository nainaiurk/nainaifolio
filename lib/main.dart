import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF66FCF1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0XFF4E31AA), // Replaces accentColor
        ),
        scaffoldBackgroundColor: const Color(0XFFF7F7F8),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF212121)),
          bodyMedium: TextStyle(color: Color(0xFF757575)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0XFF3795BD), // Replaces primary
            foregroundColor: Colors.white, // Replaces onPrimary
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF66FCF1),
        canvasColor: const Color(0XFF45A29E),
        colorScheme: const ColorScheme.dark().copyWith(
          secondary: const Color(0xFFC5C6C7),
        ),
        scaffoldBackgroundColor: Colors.black,
        cardColor: const Color(0xFF1F2833),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFC5C6C7)),
          bodyMedium: TextStyle(color: Color(0xFFB0B0B0)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0XFF0B0C10),
            foregroundColor: Colors.black,
          ),
        ),
      ),
      themeMode:
          ThemeMode.dark, // Automatically switch between light and dark mode
      home: HomeScreen(),
    );
  }
}
