import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:AlkoApp/model/Model.dart';
import 'package:AlkoApp/model/NavigationBar.dart';
import 'package:AlkoApp/widgets/CreateDrinkContainer.dart';

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => Scaffold(
        bottomNavigationBar: CustomNavigationBar(),
        body: (state.favoriteList.length == 0)
            ? Center(
                child:
                    Text("No saved favorites", style: TextStyle(fontSize: 30)),
              )
            : GridView.count(
                padding: EdgeInsets.only(top: 60),
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                children: List.generate(state.favoriteList.length, (index) {
                  return Container(
                    child: Stack(
                      children: [
                        CreateDrinkContainer(state.favoriteList[index]),
                        _deleteButton(state, index)
                      ],
                    ),
                  );
                }),
              ),
      ),
    );
  }

  Widget _deleteButton(state, index) {
    return Positioned(
      right: 15,
      top: 10,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black26, offset: Offset(0.0, 2.0), blurRadius: 30.0)
        ]),
        child: IconButton(
          icon: Icon(Icons.highlight_remove, color: Colors.white, size: 40.0),
          onPressed: () {
            state.removeFavorite(state.favoriteList[index]);
          },
        ),
      ),
    );
  }
}
