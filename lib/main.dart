import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:nainaifolio/utils/constant.dart';
import 'screens/home_screen.dart';
import 'widgets/cv_viewer_page.dart';
import 'package:universal_html/html.dart' as html;

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();
  html.EventListener? _popListener;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _popListener = (event) {
        final nav = _navKey.currentState;
        if (nav != null && nav.canPop()) {
          nav.pop();
          try {
            (event as html.PopStateEvent).preventDefault();
          } catch (_) {}
        }
      };
      html.window.addEventListener('popstate', _popListener!);
    }
  }

  @override
  void dispose() {
    if (kIsWeb && _popListener != null) {
      html.window.removeEventListener('popstate', _popListener!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navKey,
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
