import 'package:AlkoApp/model/AlkoObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:AlkoApp/DB/DB.dart';

class Model extends ChangeNotifier {
  List<AlkoObject> _alkoList = new List();
  List listToFilterOn = new List();

  int index;

  List get alkoList => _alkoList;

  Model() {
    syncLists();
  }

  void syncLists() async {
    print("Loading...");
    _alkoList = await DB.getData();
    notifyListeners();
    print("DONE!");
  }

  void setListByFilter(List input) async {
    if (listToFilterOn.length > 0) {
      _alkoList = await DB.getDataByIngredient(input);
      notifyListeners();
    } else {
      _alkoList = await DB.getData();
      notifyListeners();
    }
  }
}
