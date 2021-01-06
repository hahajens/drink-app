import 'package:flutter/material.dart';

import 'CreateDrinkContainer.dart';

class DrinkCarousel extends StatelessWidget {
  final String title;
  final List list;
  DrinkCarousel({this.title, this.list}); 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return CreateDrinkContainer(list[index]);
              }),
        ),
      ],
    );
  }
}
