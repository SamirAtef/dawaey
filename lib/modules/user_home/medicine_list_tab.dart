import 'package:dawaey/modules/user_home/medicine_list.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MedicineListTab extends StatefulWidget {
  @override
  State<MedicineListTab> createState() => _MedicineListTabState();
}

class _MedicineListTabState extends State<MedicineListTab> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String searchValue = "";
    return Scaffold(
      appBar: EasySearchBar(
          title: Text('Example'),
          searchHintText: "search hint",
          onSearch: (value) => setState(() => searchValue = value)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MedicineList();
        },
      ),
    );
  }
}
