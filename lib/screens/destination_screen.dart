import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widgets/flag_image.dart';
import '../models/destination.dart';

import 'package:go_router/go_router.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  List<Destination> destinations = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    try {
      final response = await Dio().get(
        'https://countries.dev/countries?fields=name,capital,region,population,alpha2Code',
      );

      final List<dynamic> data = response.data as List<dynamic>;

      final fetchedDestinations = data
          .map((json) => Destination.fromJson(json as Map<String, dynamic>))
          .toList();

      setState(() {
        destinations = fetchedDestinations;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Could not load destinations. Please try again.';
        isLoading = false;
      });

      debugPrint('Error fetching destinations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Destinations'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
          ? Center(child: Text(errorMessage!))
          : destinations.isEmpty
          ? const Center(child: Text('No destinations found yet ✈️'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                final destination = destinations[index];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    onTap: () {
                      context.push(
                        '/country/${Uri.encodeComponent(destination.name)}',
                      );
                    },
                    leading: FlagImage(url: destination.flagUrl, width: 50),
                    title: Text(
                      destination.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        '${destination.capital} • ${destination.region}\n'
                        'Population: ${destination.population}',
                      ),
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
