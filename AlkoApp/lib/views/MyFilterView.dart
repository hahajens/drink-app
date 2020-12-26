import 'package:AlkoApp/model/Model.dart';
import 'package:AlkoApp/model/NavigationBar.dart';
import 'package:AlkoApp/model/IngredientObject.dart';
import 'package:AlkoApp/widgets/Spinner.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();

    return Consumer<Model>(
      builder: (context, state, child) => Scaffold(
        appBar: _myHomeAppbar(),
        drawer: _myHomeDrawer(),
        body: Column(
          children: [
            Row(
              children: [
                _searchBar(context, state, editingController),
                _filterButton(context, state, editingController),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _showFilterIngredients(state),
                _clearButton(context, state)
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            _myCustomListView(
                _filter(state.alkoList, state, editingController, context)),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

  Widget _showFilterIngredients(state) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
        child: Text(
          "Valda ingredienser: ${state.listToFilterOn.toString()}",
          style: TextStyle(fontSize: 15),
        ),
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

  Widget _clearButton(context, state) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.18,
      child: Padding(
        padding: EdgeInsets.fromLTRB(3, 0, 10, 0),
        child: FlatButton(
          color: Colors.blue[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Icon(Icons.clear),
          onPressed: () {
            state.listToFilterOn.clear();
            state.setListByIngredient(state.listToFilterOn, context);
          },
        ),
      ),
    );
  }

  Widget _filterButton(BuildContext context, state, editingController) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      width: MediaQuery.of(context).size.width * 0.20,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 7, 0),
        child: FlatButton(
          color: Colors.blue[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Icon(Icons.filter_alt),
          onPressed: () {
            _filterDialog(context, state);
          },
        ),
      ),
    );
  }

  _filterDialog(BuildContext context, state) async {
    List<IngredientObject> listOfIngredients = await state.getIngredientsList();
    listOfIngredients
        .sort((a, b) => a.strIngredient1.compareTo(b.strIngredient1));

    //TextEditingController editingController = TextEditingController();

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
                              },
                              child: Card(
                                color: state
                                    .getFilterColor(listOfIngredients[index]),
                                child: Stack(
                                  children: [
                                    FadeInImage.assetNetwork(
                                      placeholder:
                                          "assets/images/spinningwheel.gif",
                                      image: listOfIngredients[index].pic,
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
                Text("Filtrerad på: ${state.listToFilterOn}"),
                //_filterMenuSearchBar(editingController),
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

  // Widget _filterMenuSearchBar(editingController) {
  //   return TextField(
  //     controller: editingController,
  //     decoration: InputDecoration(
  //       hintText: "Search",
  //       prefixIcon: Icon(Icons.search),
  //       suffixIcon: IconButton(
  //         onPressed: () => editingController.clear(),
  //         icon: Icon(Icons.clear),
  //       ),
  //     ),
  //   );
  // }

  // _filterMenuFilter(list, editingController) {
  //   if (editingController.text != null && editingController.text != "") {
  //     List filterMenuList = list
  //         .where((s) => s.strIngredient1
  //             .toString()
  //             .toLowerCase()
  //             .contains(editingController.text.toLowerCase()))
  //         .toList();
  //     print(filterMenuList);
  //     return filterMenuList;
  //   } else {
  //     return list;
  //   }
  // }

  Widget _searchBar(BuildContext context, state, editingController) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 13, 0, 5),
        child: TextField(
          autofocus: false,
          controller: editingController,
          decoration: InputDecoration(
            labelText: "Search",
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
              onPressed: () => editingController.clear(),
              icon: Icon(Icons.clear),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
          ),
        ),
      ),
    );
  }

  _filter(list, state, editingController, context) {
    if (editingController.text != null && editingController.text != "") {
      List filteredList = list
          .where((s) => s.strDrink
              .toString()
              .toLowerCase()
              .contains(editingController.text.toLowerCase()))
          .toList();
      state.setFilteredList(filteredList);

      return state.filteredList;
    } else {
      return list;
    }
  }

  Widget _myCustomListView(list) {
    return Expanded(
      child: Consumer<Model>(
          builder: (context, state, child) => (state.isLoading == true)
              ? Spinner()
              : GridView.count(
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
                )),
    );
  }

  Widget _myCustomListTile(list, index) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: FadeInImage.assetNetwork(
              placeholder: "assets/images/spinningwheel.gif",
              image: (list[index].strDrinkThumb == null)
                  ? "assets/images/noimage.png"
                  : list[index].strDrinkThumb,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 18),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 180,
              decoration: BoxDecoration(
                color: const Color(0xFF607D8B).withOpacity(0.7),
                borderRadius: BorderRadius.circular(25),
              ),
              height: 35,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 3, 1, 1),
                child: Text(
                  "${list[index].strDrink}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}