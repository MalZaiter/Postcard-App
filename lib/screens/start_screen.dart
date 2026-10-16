import 'package:flutter/material.dart';

import 'destination_screen.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const StartScreen({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // circular badge for logo
            CircleAvatar(
              radius: 45,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                Icons.location_pin,
                size: 48,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),

            const SizedBox(height: 24),

            // app name
            Text(
              'Postcard',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 8),

            // tagline
            Text(
              'Save your memories!',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),

            const SizedBox(height: 32),

            // button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DestinationScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Get Started'),
            ),

            const SizedBox(height: 8),

            IconButton(
              onPressed: onToggleTheme,
              tooltip: 'Toggle theme',
              icon: const Icon(Icons.brightness_6),
              color: Theme.of(context).colorScheme.primary,
              iconSize: 28,
            ),
          ],
        ),
      ),
    );
  }
}
