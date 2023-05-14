import 'package:dawaey/models/location_model/location_model.dart';
import 'package:dawaey/models/medicine_model/medicine.dart';
import 'dart:convert';
import 'package:dawaey/models/medicine_model/medicine.dart';

import 'package:http/http.dart' as http;

class Api {
  Future<List<Medicine>> fetchMedicines() async {
    final response = await http.get(Uri.parse(
        'https://medcine1231.000webhostapp.com/user/select_medcine.php'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['massage'];
      print(response.body);

      if (data is List) {
        return data.map((json) => Medicine.fromJson(json)).toList();
      } else {
        throw Exception('Invalid response format - expected a list: $data');
      }
    } else {
      throw Exception('Failed to load medicines: ${response.statusCode}');
    }
  }

  Future<List<Location>> fetchLocations() async {
    final response = await http.get(Uri.parse(
        'https://medcine1231.000webhostapp.com/user/select_locations.php'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['massage'];
      if (data is List) {
        return data.map<Location>((json) => Location.fromJson(json)).toList();
      } else {
        throw Exception('Failed to parse locations');
      }
    } else {
      throw Exception('Failed to load locations');
    }
  }
}
