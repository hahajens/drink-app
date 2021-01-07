import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:AlkoApp/model/Model.dart';
import 'package:AlkoApp/widgets/NavigationBar.dart';
import 'package:AlkoApp/widgets/DrinkCarousel.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: ListView(
          children: [
            DrinkCarousel(
                title: 'Popular Drinks',
                list: Provider.of<Model>(context, listen: false).popularList),
            DrinkCarousel(
                title: 'Latest Drinks',
                list: Provider.of<Model>(context, listen: false).latestList),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
        //floatingActionButton: _surpriseButton(context, state),
      ),
    );
  }

  //Widget för "random-knappen", använder listan randomList med ett random element
  /*Widget _surpriseButton(BuildContext context, state) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.blueGrey,
      onPressed: () {
        state.randomDrink();
        Navigator.pushNamed(context, '/DrinkView',
            arguments: state.randomList[0].idDrink);
      },
      label: Text("Surprise Me!", style: TextStyle(fontSize: 22.0)),
      icon: Icon(Icons.local_drink_outlined),
    );
  }*/
}
