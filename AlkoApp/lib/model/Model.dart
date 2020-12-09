import 'package:AlkoApp/model/AlkoObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:AlkoApp/DB/DB.dart';

class Model extends ChangeNotifier {
  List<AlkoObject> alkoList = new List();
  List<AlkoObject> filteredList = new List();

  bool returnFiltered = false;
  int index;

  Model() {
    syncLists();
  }

  void syncLists() async {
    print("Loading...");
    alkoList = await DB.getData();
    notifyListeners();
    print("DONE!");
  }

//TODO
  List<AlkoObject> getList({input}) {
    if (returnFiltered == true) {
      returnFiltered = false;
      //where-funktion
      filteredList =
          alkoList.where((element) => element.getStrDrink == input).toList();
      return filteredList;
    } else {
      returnFiltered = true;
      return alkoList;
    }
  }
}
