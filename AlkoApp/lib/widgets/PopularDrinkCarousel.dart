import 'package:AlkoApp/model/Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CreateDrinkContainer.dart';

class PopularDrinkCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Popular Drinks',
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
                  Provider.of<Model>(context, listen: false).popularList.length,
              itemBuilder: (BuildContext context, int index) {
                return CreateDrinkContainer(
                    Provider.of<Model>(context, listen: false)
                        .popularList[index]);
              }),
        ),
      ],
    );
  }
}
