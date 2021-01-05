import 'dart:io';
import 'package:flutter/material.dart';
import 'MediaSize.dart';

class CustomNavigationBar extends StatelessWidget {
  final Color _mainColor =
      Colors.white; //Color(0xFFE5E5E5); //Colors.blueGrey; //white
  final Color _iconColor = Colors.blueGrey[400]; //blueGrey[400]
  final double _iconSize = 40; //0.05
  final double _fontSize = 0.025;

  Widget build(BuildContext context) {
    return Container(
      height: Platform.isAndroid
          ? displayHeight(context) * 0.1
          : displayHeight(context) * 0.1, //80,
      decoration: BoxDecoration(
        color: _mainColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                IconButton(
                    icon: Icon(Icons.lightbulb_outline, //home_outlined,
                        size: displayHeight(context) * 0.05,
                        color: _iconColor),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/StartView');
                    }),

                Text("Inspiration",
                    style: TextStyle(
                        fontSize: displayHeight(context) * _fontSize)) //_fontSize
              ],
            ),
            Column(
              children: [
                IconButton(
                    icon: Icon(Icons.explore_outlined,
                        size: _iconSize, color: _iconColor),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/MyFilterView');
                    }),
                Text(" Explore", style: TextStyle(fontSize: displayHeight(context) * _fontSize)),
              ],
            ),
            /*Column(
              children: [
                IconButton(
                    icon:
                        Icon(Icons.search, size: _iconSize, color: _iconColor),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/MySearchView');
                    }),
                Text(" Search", style: TextStyle(fontSize: _fontSize)),
              ],
            ),*/
            Column(
              children: [
                IconButton(
                    icon: Icon(Icons.favorite_border_outlined,
                        size: _iconSize, color: _iconColor),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/MyFavoritesView');
                    }),
                Text("    Favorites ", style: TextStyle(fontSize: displayHeight(context) * _fontSize)),
              ],
            ),
          ]),
    );
  }
}
