import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:AlkoApp/model/Model.dart';

class CustomNavigationBar extends StatelessWidget {
  final Color _mainColor = Colors.white;
  final double _iconSize = 0.05;
  final double _fontSize = 0.020;

  Widget build(BuildContext context) {
    var provider = Provider.of<Model>(context);
    return Container(
      //Android eller iPhone
      height: Platform.isAndroid
          ? MediaQuery.of(context).size.height * 0.1
          : MediaQuery.of(context).size.height * 0.11,

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, -10.0),
            blurRadius: 20.0,
          ),
        ],
        color: _mainColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                children: [
                  IconButton(
                      icon: Icon(Icons.lightbulb_outline,
                          size: MediaQuery.of(context).size.height * _iconSize,
                          color: provider.getIconColor(0)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/StartView');
                        provider.setIconColor(0);
                      }),
                  Text("Inspiration",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.height * _fontSize,
                          color: provider.getIconColor(0)))
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                children: [
                  Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.explore_outlined,
                              size: MediaQuery.of(context).size.height *
                                  _iconSize,
                              color: provider.getIconColor(1)), //_iconColor),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/FilterView');
                            provider.setIconColor(1);
                          }),
                      Text("Explore",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height *
                                  _fontSize,
                              color: provider.getIconColor(1)))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                children: [
                  IconButton(
                      icon: Icon(Icons.favorite_border_outlined,
                          size: MediaQuery.of(context).size.height * _iconSize,
                          color: provider.getIconColor(
                              2)), //provider.getColor()),//_iconColor),
                      onPressed: () {
                        Provider.of<Model>(context, listen: false)
                            .getFavoriteListData();
                        Navigator.pushReplacementNamed(
                            context, '/FavoritesView');
                        //provider.setIconColor(2);
                        provider.setIconColor(2);
                      }),
                  Text(
                    "Favorites",
                    style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.height * _fontSize,
                        color: provider.getIconColor(2)),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                children: [
                  IconButton(
                      icon: Icon(CupertinoIcons.gift, //auto_awesome,
                          size: MediaQuery.of(context).size.height * _iconSize,
                          color: provider.getIconColor(3)),
                      onPressed: () {
                        provider.randomDrink();
                        Navigator.pushNamed(context, '/DrinkView',
                            arguments: provider.randomList[0].idDrink);
                        provider.setIconColor(3);
                      }),
                  Text(
                    "Surprise",
                    style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.height * _fontSize,
                        color: provider.getIconColor(3)),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
