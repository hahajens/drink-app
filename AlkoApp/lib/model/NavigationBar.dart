import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MediaSize.dart';
import 'Model.dart';

class CustomNavigationBar extends StatelessWidget {
  final Color _mainColor = Colors.white;
  final double _iconSize = 0.05; //
  final double _fontSize = 0.025;

  Widget build(BuildContext context) {
    var provider = Provider.of<Model>(context);
    return Container(
      height: Platform.isAndroid
          ? displayHeight(context) * 0.1
          : displayHeight(context) * 0.12, //80,

      decoration: BoxDecoration(
        color: _mainColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: displayWidth(context) * 0.3,
              child: Column(
                children: [
                  IconButton(
                      icon: Icon(Icons.lightbulb_outline, //home_outlined,
                          size: displayHeight(context) * _iconSize,
                          color: provider.getIconColor(0)), //_iconColor),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/StartView');
                        provider.setIconColor(0);
                      }),
                  Text("Inspiration",
                      style: TextStyle(
                          fontSize: displayHeight(context) * _fontSize,
                          color: provider.getIconColor(0)))
                ],
              ),
            ),
            Container(
              width: displayWidth(context) * 0.3,
              child: Column(
                children: [
                  Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.explore_outlined,
                              size: displayHeight(context) * _iconSize,
                              color: provider.getIconColor(1)), //_iconColor),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/MyFilterView');
                            provider.setIconColor(1);
                          }),
                      Text("Explore",
                          style: TextStyle(
                              fontSize: displayHeight(context) * _fontSize,
                              color: provider.getIconColor(1)))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: displayWidth(context) * 0.3,
              child: Column(
                children: [
                  IconButton(
                      icon: Icon(Icons.favorite_border_outlined,
                          size: displayHeight(context) * _iconSize,
                          color: provider.getIconColor(
                              2)), //provider.getColor()),//_iconColor),
                      onPressed: () {
                        Provider.of<Model>(context, listen: false)
                            .getFavoriteListData();
                        Navigator.pushReplacementNamed(
                            context, '/MyFavoritesView');
                        //provider.setIconColor(2);
                        provider.setIconColor(2);
                      }),
                  Text(
                    "Favorites",
                    style: TextStyle(
                        fontSize: displayHeight(context) * _fontSize,
                        color: provider.getIconColor(2)),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
