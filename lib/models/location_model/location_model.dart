import 'dart:convert';

class Location {
  final String id;
  final String name;
  final String address;
  final String image;

  Location({
    required this.id,
    required this.name,
    required this.address,
    required this.image,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['location_id'],
      name: json['location_name'],
      address: json['location_description'],
      image: json['location_image'] ?? '',
    );
  }
}

List<Location> parseLocations(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Location>((json) => Location.fromJson(json)).toList();
}
