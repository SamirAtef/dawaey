import 'package:dawaey/modules/custom_widget/customcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            Image(image: AssetImage('images/charty.jpg')),
            SizedBox(
              height: 25,
            ),
            CustomCard(text: "title"),
            SizedBox(
              height: 15,
            ),
            CustomCard(text: "description", maxLines: 5),
            SizedBox(
              height: 15,
            ),
            CustomCard(text: "Location"),
            SizedBox(
              height: 15,
            ),
            CustomCard(text: 'Stock'),
          ],
        ),
      ),
    );
  }
}
