import 'package:AlkoApp/model/Model.dart';
import 'package:AlkoApp/model/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseFilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => Scaffold(
        appBar: _myHomeAppbar(),
        drawer: _myHomeDrawer(),
        body: Center(
          child: Column(
            children: [
              _filterButton(context),
              _searchButton(context),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

  Widget _filterButton(context) {
    return FlatButton(
      color: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Text("Filter"),
      onPressed: () {
        Navigator.pushNamed(context, '/MyFilterView');
      },
    );
  }

  Widget _searchButton(context) {
    return FlatButton(
      color: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Text("Search"),
      onPressed: () {
        Navigator.pushNamed(context, '/MySearchView');
      },
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
}
