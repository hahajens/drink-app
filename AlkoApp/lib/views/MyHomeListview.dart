import 'package:AlkoApp/views/ObjectInfoview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:AlkoApp/model/Model.dart';

class MyHomeListview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myHomeAppbar(),
      drawer: _myHomeDrawer(),
      body: Column(
        children: [
          _mySearchBar(),
          Expanded(child: MyCustomListview()),
        ],
      ),
    );
  }

  Widget _myHomeAppbar() {
    return AppBar(
      title: Text("NIKLAS"),
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

  Widget _mySearchBar() {
    TextEditingController controller = new TextEditingController();
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Filter',
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class MyCustomListview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => ListView.builder(
        itemCount: state.alkoList.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(state.alkoList[index].strDrinkThumb),
              ),
              title: Text("${state.alkoList[index].strDrink}"),
              trailing: Text("${state.alkoList[index].strAlcoholic}"),
              onTap: () {
                state.index = index;
                Navigator.pushNamed(context, '/ObjectInfoview');
              });
        },
      ),
    );
  }
}
