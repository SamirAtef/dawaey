import 'package:dawaey/models/medicine_model/medicine.dart';
import 'package:dawaey/modules/custom_widget/customcard.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Medicine medicine;

  const DetailsScreen({Key? key, required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Image.network(
              medicine.image,
              height: 150,
              width: 150,
            ),
            SizedBox(
              height: 25,
            ),
            CustomCard(
              text: 'Name: ${medicine.name}',
            ),
            SizedBox(
              height: 15,
            ),
            CustomCard(
              text: 'Description: ${medicine.description}',
              maxLines: 5,
            ),
            SizedBox(
              height: 15,
            ),
            CustomCard(text: 'Location: ${medicine.locationName}'),
            SizedBox(
              height: 15,
            ),
            CustomCard(text: 'Type: ${medicine.medicineType}'),
            SizedBox(
              height: 15,
            ),
            CustomCard(text: 'Stock: ${medicine.quantity}'),
            SizedBox(
              height: 15,
            ),
            CustomCard(text: 'ExDate: ${medicine.expDate.toString()}'),
          ],
        ),
      ),
    );
  }
}
