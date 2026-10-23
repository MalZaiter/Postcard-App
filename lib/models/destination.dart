class Destination {
  final String name;
  final String capital;
  final String region;
  final int population;
  final String flagUrl;

  Destination({
    required this.name,
    required this.capital,
    required this.region,
    required this.population,
    required this.flagUrl,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    final code = json['alpha2Code'] ?? '';

    return Destination(
      name: json['name'] ?? 'Unknown',
      capital: json['capital'] == null || json['capital'].toString().isEmpty
          ? 'N/A'
          : json['capital'],
      region: json['region'] ?? 'Unknown',
      population: json['population'] ?? 0,
      flagUrl: code.isEmpty
          ? ''
          : 'https://flagcdn.com/w80/${code.toString().toLowerCase()}.png',
    );
  }
}
