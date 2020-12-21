import 'package:AlkoApp/model/Model.dart';

import 'package:AlkoApp/model/NavigationBar.dart';
import 'package:AlkoApp/model/IngredientObject.dart';

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
            _searchBar(context, state),
            Divider(
              color: Colors.black,
            ),
            _filterButton(context, state),
            _myCustomListView(state.alkoList),
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
  //2. lägg till sökfunktionalitet

  Widget _searchBar(BuildContext context, state) {
    TextEditingController editingController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 5, 3, 0),
      child: TextField(
        controller: editingController,
        decoration: InputDecoration(
            labelText: "Search",
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    );
  }

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
                  color: Colors.blueGrey,
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
                  color: Colors.blueGrey,
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

  Widget _myCustomListView(list) {
    return Expanded(
      child: Consumer<Model>(
        builder: (context, state, child) => GridView.count(
          crossAxisCount: 2,
          children: List.generate(list.length, (index) {
            return Container(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/DrinkView',
                        arguments: list[index].idDrink);
                  },
                  child: _myCustomListTile(list, index)),
            );
          }),
        ),
      ),
    );
  }

  Widget _myCustomListTile(list, index) {
    return Card(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Hero(
                tag: list[index].strDrinkThumb,
                child: Image(
                  image: NetworkImage(list[index].strDrinkThumb),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 500,
              decoration: BoxDecoration(
                color: const Color(0xFF607D8B).withOpacity(0.7),
              ),
              height: 50,
              child: Text(
                "${list[index].strDrink}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
          )
        ],
      ),
      color: Colors.grey[300],
    );
  }
}
