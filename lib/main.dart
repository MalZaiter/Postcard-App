import 'package:flutter/material.dart';

void main() {
  runApp(const PostcardApp());
}

class PostcardApp extends StatelessWidget {
  const PostcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: StartScreen());
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141E46),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // circular badge for logo
            const CircleAvatar(
              radius: 45,
              backgroundColor: Color(0xFFFFF5E0),
              child: Icon(
                Icons.location_pin,
                size: 48,
                color: Color(0xFF141E46),
              ),
            ),

            const SizedBox(height: 24),

            // app name
            const Text(
              'Postcard',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFF5E0),
              ),
            ),

            const SizedBox(height: 8),

            // tagline
            const Text(
              'Save your memories!',
              style: TextStyle(fontSize: 16, color: Color(0xFFFFF5E0)),
            ),

            const SizedBox(height: 32),

            // button: functionality will be added later
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF790D16),
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
          ],
        ),
      ),
    );
  }
}
