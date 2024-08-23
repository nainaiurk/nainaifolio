import 'package:flutter/material.dart';
import 'package:nainaifolio/utils/constant.dart';
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
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:
          ThemeMode.dark, // Automatically switch between light and dark mode
      home: const HomeScreen(),
    );
  }
}
