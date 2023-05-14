import 'package:dawaey/models/medicine_model/medicine.dart';
import 'package:dawaey/modules/medicine_details/details_screen.dart';
import 'package:flutter/material.dart';

class MedicineList extends StatelessWidget {
  final Medicine medicine;

  const MedicineList({Key? key, required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(medicine: medicine),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              offset: const Offset(10, 10),
            ),
          ],
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  medicine.image,
                  fit: BoxFit.fill,
                  height: 75,
                  width: 75,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      'images/dawaee.jpeg',
                      fit: BoxFit.fill,
                      height: 75,
                      width: 75,
                    );
                  },
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        medicine.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        medicine.locationName,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
