import 'package:AlkoApp/model/Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CreateDrinkContainer.dart';

class LatestDrinksCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 20.0),
            alignment: Alignment.topLeft,
            child: Text(
              'Recently added drinks',
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
              itemCount:
                  Provider.of<Model>(context, listen: false).latestList.length,
              itemBuilder: (BuildContext context, int index) {
                return CreateDrinkContainer(
                    Provider.of<Model>(context, listen: false)
                        .latestList[index]);
              }),
        ),
      ],
    );
  }
}
