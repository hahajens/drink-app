import 'package:AlkoApp/model/Model.dart';
import 'package:AlkoApp/model/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();

    return Consumer<Model>(
      builder: (context, state, child) => Scaffold(
        appBar: _myHomeAppbar(),
        drawer: _myHomeDrawer(),
        body: Column(
          children: [
            _searchBar(context, state, editingController),
            _myCustomListView(
                _filter(state.alkoList, state, editingController, context)),
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

  Widget _searchBar(BuildContext context, state, editingController) {
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

  _filter(list, state, editingController, context) {
    if (editingController.text != null) {
      state.getCocktailsByString(editingController.text, context);

      return list;
    } else {
      return list;
    }
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
              child: Image(
                  image: (list[index].strDrinkThumb == null)
                      ? NetworkImage(
                          "https://www.thecocktaildb.com/images/ingredients/gin-Small.png")
                      : NetworkImage(list[index].strDrinkThumb)),
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
