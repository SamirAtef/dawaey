import 'package:dawaey/api_service.dart';
import 'package:dawaey/models/location_model/location_model.dart';
import 'package:dawaey/modules/MedicineByLocation/location_search.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class LocationListTab extends StatefulWidget {
  @override
  State<LocationListTab> createState() => _LocationListTabState();
}

class _LocationListTabState extends State<LocationListTab> {
  late Future<List<Location>?> _locationsFuture;
  String _searchValue = "";
  @override
  void initState() {
    super.initState();
    _locationsFuture = Api().fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        title: Text('Locations'),
        searchHintText: "Search for a location",
        onSearch: (value) => setState(() => _searchValue = value),
      ),
      body: FutureBuilder<List<Location>?>(
        future: _locationsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Location>? medicines = snapshot.data;
            final filteredLocations = _searchValue.isEmpty
                ? medicines
                : medicines
                    ?.where((medicine) => medicine.name
                        .toLowerCase()
                        .contains(_searchValue.toLowerCase()))
                    .toList();
            return ListView.builder(
              itemCount: filteredLocations?.length ?? 0,
              itemBuilder: (context, index) {
                final location = filteredLocations![index];
                return LocationsList(location: location);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load medicines: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
