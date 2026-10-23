import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/start_screen.dart';
import 'screens/destination_screen.dart';

void main() {
  runApp(const PostcardApp());
}

final List<Map<String, String>> destinations = [
  {'name': 'Tokyo, Japan', 'category': 'City break'},
  {'name': 'Bali, Indonesia', 'category': 'Beach getaway'},
  {'name': 'Paris, France', 'category': 'Culture & romance'},
  {'name': 'Interlaken, Switzerland', 'category': 'Nature & adventure'},
  {'name': 'Cairo, Egypt', 'category': 'History & culture'},
];

class PostcardApp extends StatefulWidget {
  const PostcardApp({super.key});

  @override
  State<PostcardApp> createState() => _PostcardAppState();
}

class _PostcardAppState extends State<PostcardApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  late final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            StartScreen(onToggleTheme: _toggleTheme),
      ),
      GoRoute(
        path: '/destinations',
        builder: (context, state) => const DestinationScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFFFF5E0),
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF790D16), // Burgundy
          onPrimary: const Color(0xFFFFF5E0), // Cream text on burgundy
          surface: const Color(0xFFFFF5E0),
          onSurface: const Color(0xFF141E46), // Navy text on cream
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF141E46),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF790D16), // Burgundy buttons
          onPrimary: const Color(0xFFFFF5E0), // Cream text on burgundy
          surface: const Color(0xFF141E46),
          onSurface: const Color(0xFFFFF5E0), // Cream text on navy
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF790D16), // Burgundy
          foregroundColor: Color(0xFFFFF5E0), // Cream text on burgundy
        ),

        cardTheme: const CardThemeData(
          color: Color(0xFF1E2A5C), // Darker navy for cards
          shadowColor: Colors.black54,
        ),
      ),

      themeMode: _themeMode,

    );
  }
}
