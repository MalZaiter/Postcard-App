import 'package:flutter/material.dart';

import '../main.dart';

class DestinationScreen extends StatelessWidget {
  const DestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Destinations'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Color(0xFFFFF5E0), // Cream text on burgundy
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            final destination = destinations[index];
            return Card(
              child: ListTile(
                leading: Icon(
                  Icons.place,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  destination['name']!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  destination['category']!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
