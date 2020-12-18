import 'package:AlkoApp/model/AlkoObject.dart';
import 'package:AlkoApp/model/Model.dart';
import 'package:AlkoApp/model/NavigationBar.dart';
import 'package:AlkoApp/model/IngredientObject.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO ändra hur height och width sätts
class MySearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => Scaffold(
        appBar: _myHomeAppbar(),
        drawer: _myHomeDrawer(),
        body: Column(
          children: [
            //_mySearchBar(),
            _filterButton(context, state),
            _myCustomListview(state.alkoList),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

  Widget _myHomeAppbar() {
    return AppBar(
      title: Text("Söksida/filtrering"),
    );
  }

  Widget _myHomeDrawer() {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("bens"),
            onTap: () {
              //Navigator eller routes
            },
          ),
          ListTile(title: Text("knens")),
          ListTile(title: Text("slens")),
        ],
      ),
    );
  }

  //TODO
  //1. lägg till spinner
  //2. lägg till sök i filtervy

  Widget _filterButton(BuildContext context, state) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 200,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: FlatButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text("Filtrera"),
                  onPressed: () {
                    _filterDialog(context, state);
                  },
                ),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: FlatButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Icon(Icons.close),
                  onPressed: () {
                    state.listToFilterOn.clear();
                    state.setListByIngredient(state.listToFilterOn, context);
                  },
                ),
              ),
            ),
          ],
        ),
        Text(
          "Filter: ${state.listToFilterOn.toString()}",
          style: TextStyle(fontSize: 15),
        ),
        Divider(
          color: Colors.black,
        ),
      ],
    );
  }

  _filterDialog(BuildContext context, state) async {
    List<IngredientObject> listOfIngredients = await state.getIngredientsList();

    Widget filterButton = FlatButton(
      child: Text("Filtrera"),
      onPressed: () {
        Navigator.pop(context);
        state.setListByIngredient(state.listToFilterOn, context);
      },
    );

    Widget cancelButton = FlatButton(
      child: Text("Rensa filter"),
      onPressed: () {
        Navigator.pop(context);
        state.listToFilterOn.clear();
        state.setListByIngredient(state.listToFilterOn, context);
      },
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Model>(
          builder: (context, state, child) => AlertDialog(
            title: Text("Filtermeny"),
            content: Column(
              children: [
                Expanded(
                  child: Scrollbar(
                    child: Container(
                      height: MediaQuery.of(context).size.width * 1.2,
                      width: MediaQuery.of(context).size.width * .7,
                      child: GridView.count(
                        crossAxisCount: 3,
                        children:
                            List.generate(listOfIngredients.length, (index) {
                          return Container(
                            child: GestureDetector(
                              onTap: () {
                                state.setFilterColor(listOfIngredients[index]);

                                //lägger till eller tar bort ur listan beroende på om den redan finns
                                if (state.listToFilterOn.contains(
                                    listOfIngredients[index].strIngredient1)) {
                                  state.listToFilterOn.remove(
                                      listOfIngredients[index].strIngredient1);
                                } else {
                                  state.listToFilterOn.add(
                                      listOfIngredients[index].strIngredient1);
                                }

                                //print("Tapped: ${listOfIngredients[index]}");
                              },
                              child: Card(
                                color: state
                                    .getFilterColor(listOfIngredients[index]),
                                child: Stack(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          listOfIngredients[index].pic),
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          listOfIngredients[index]
                                              .strIngredient1,
                                          style: TextStyle(
                                              backgroundColor:
                                                  Colors.grey[300]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Text("Filtrerad på: ${state.listToFilterOn}")
              ],
            ),
            actions: [
              cancelButton,
              filterButton,
            ],
          ),
        );
      },
    );
  }

  Widget _myCustomListview(list) {
    return Expanded(
      child: Consumer<Model>(
        builder: (context, state, child) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/DrinkView',
                      arguments: list[index]);
                },
                child: _myCustomListTile(list, index),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _myCustomListTile(list, index) {
    return Card(
      color: Colors.blueGrey[300],
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                image: NetworkImage(list[index].strDrinkThumb),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 5, 0, 0),
            child: Container(
              width: 200,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${list[index].strDrink}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "${list[index].strGlass}",
                      style: TextStyle(fontSize: 17),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Text(
                        "${list[index].strInstructions}",
                        style: TextStyle(fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ]),
            ),
          ),
          Container(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
