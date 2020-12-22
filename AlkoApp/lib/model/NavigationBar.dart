import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final Color _mainColor = Colors.blue;
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
                    icon: Icon(Icons.home_outlined,
                        size: _iconSize, color: _iconColor),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/StartView');
                    }),
                Text(" Home", style: TextStyle(fontSize: _fontSize)),
              ],
            ),
            Column(
              children: [
                IconButton(
                    icon:
                        Icon(Icons.search, size: _iconSize, color: _iconColor),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/MyFilterView');
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
            Column(
              children: [
                IconButton(
                    icon: Icon(Icons.no_drinks_outlined,
                        size: _iconSize, color: _iconColor),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/MyDrinksView');
                    }),
                Text(" My Drinks", style: TextStyle(fontSize: _fontSize)),
              ],
            ),
          ]),
    );
  }
}
