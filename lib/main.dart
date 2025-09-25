import 'package:flutter/material.dart';
import 'package:nainaifolio/utils/constant.dart';
import 'screens/home_screen.dart';
import 'widgets/cv_viewer_page.dart';

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
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => const HomeScreen(),
        '/cv': (context) => const CVViewerPage(),
      },
      initialRoute: '/',
    );
  }
}
