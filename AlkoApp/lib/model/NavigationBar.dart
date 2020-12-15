import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:AlkoApp/views/AgeView.dart';
import 'package:AlkoApp/views/DrinkView.dart';
import 'package:AlkoApp/views/MyDrinksView.dart';
import 'package:AlkoApp/views/MySearchView.dart';
import 'package:AlkoApp/model/Model.dart';

//Klassem för NavigationBar

class NavigationBar extends StatelessWidget {
  Widget build(BuildContext context) {
    var provider = Provider.of<Model>(context);
    //Innehållet i currentTab avgör vilka sidor som baren består av
    var currentTab = [
      MySearchView(),
      AgeView(),
      DrinkView(),
      MyDrinksView(),
    ];
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blue,
        iconSize: 27.0,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "AgeView"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), label: "DrinkView"),
          BottomNavigationBarItem(icon: Icon(Icons.no_drinks), label: "MyDrinksView"),
        ],
      ),
    );
  }
}
