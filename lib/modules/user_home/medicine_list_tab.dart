import 'package:dawaey/api_service.dart';
import 'package:dawaey/models/medicine_model/medicine.dart';
import 'package:dawaey/modules/user_home/medicine_list.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class MedicineListTab extends StatefulWidget {
  @override
  _MedicineListTabState createState() => _MedicineListTabState();
}

class _MedicineListTabState extends State<MedicineListTab> {
  String _searchValue = "";

  late Future<List<Medicine>> _medicinesFuture;

  @override
  void initState() {
    super.initState();
    _medicinesFuture = Api().fetchMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        title: Text('Medicines'),
        searchHintText: "Search for a medicine",
        onSearch: (value) => setState(() => _searchValue = value),
      ),
      body: FutureBuilder<List<Medicine>>(
        future: _medicinesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Medicine>? medicines = snapshot.data;
            final filteredMedicines = _searchValue.isEmpty
                ? medicines
                : medicines
                    ?.where((medicine) => medicine.name
                        .toLowerCase()
                        .contains(_searchValue.toLowerCase()))
                    .toList();
            return ListView.builder(
              itemCount: filteredMedicines?.length ?? 0,
              itemBuilder: (context, index) {
                final medicine = filteredMedicines![index];
                return MedicineList(
                  medicine: medicine,
                );
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
