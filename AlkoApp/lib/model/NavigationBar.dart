import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final Color _mainColor = Colors.white;//Color(0xFFE5E5E5); //Colors.blueGrey;
  final Color _iconColor = Colors.black;
  final double _iconSize = 40;
  final double _fontSize = 18;

  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: _mainColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                IconButton(
                    icon: Icon(Icons.lightbulb_outline, //home_outlined,
                        size: _iconSize, color: _iconColor),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/StartView');
                    }),
                Text(" Inspiration", style: TextStyle(fontSize: _fontSize)),
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
                Text(" Explore", style: TextStyle(fontSize: _fontSize)),
              ],
            ),
            Column(
              children: [
                IconButton(
                    icon:
                        Icon(Icons.search, size: _iconSize, color: _iconColor),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/MyDrinksView');
                    }),
                Text(" Search", style: TextStyle(fontSize: _fontSize)),
              ],
            ),
            Column(
              children: [
                IconButton(
                    icon: Icon(Icons.favorite_border_outlined,
                        size: _iconSize, color: _iconColor),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/MyFavoritesView');
                    }),
                Text(" Favorites", style: TextStyle(fontSize: _fontSize)),
              ],
            ),
          ]),
    );
  }
}
