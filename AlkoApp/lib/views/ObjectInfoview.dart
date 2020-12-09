import 'package:AlkoApp/model/Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ObjectInfoview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myObjectInfoAppbar(),
      body: ObjectView(),
    );
  }

  _myObjectInfoAppbar() {
    return AppBar(
      title: Text("JENSOR"),
    );
  }
}

class ObjectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => Column(
        children: [
          Text("${state.alkoList[state.index].strIngredient1}"),
          Text("${state.alkoList[state.index].strIngredient2}"),
          Text("${state.alkoList[state.index].strIngredient3}"),
          Text("${state.alkoList[state.index].strIngredient4}"),
          Text("${state.alkoList[state.index].strIngredient5}"),
        ],
      ),
    );
  }
}
