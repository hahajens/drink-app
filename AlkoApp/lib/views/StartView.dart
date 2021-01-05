import 'package:AlkoApp/model/Model.dart';
import 'package:AlkoApp/widgets/LatestDrinksCarousel.dart';
import 'package:AlkoApp/widgets/PopularDrinkCarousel.dart';
import 'package:flutter/material.dart';
import 'package:AlkoApp/model/NavigationBar.dart';
import 'package:provider/provider.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: ListView(
          children: [
            PopularDrinkCarousel(),
            // Container(
            //   height: 80,
            //   width: 500,
            //   child: Padding(
            //     padding: EdgeInsets.fromLTRB(80, 0, 80, 20),
            //     child: _supriseButton(context, state),
            //   ),
            // ),
            LatestDrinksCarousel(),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
        floatingActionButton: _surpriseButton(context, state),
      ),
    );
  }

  Widget _surpriseButton(BuildContext context, state) {
    return FloatingActionButton.extended(
      onPressed: () {
        state.randomDrink();
        Navigator.pushNamed(context, '/DrinkView',
            arguments: state.randomList[0].idDrink);
      },
      label: Text("Surprise Me!", style: TextStyle(fontSize: 22.0)),
      icon: Icon(Icons.local_drink_outlined),
    );
  }
}
