import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  CustomCard({this.text, this.maxLines});
  String? text;
  var maxLines;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 40,
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            offset: Offset(10, 10))
      ]),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '$text',
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
