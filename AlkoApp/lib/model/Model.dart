import 'package:AlkoApp/model/AlkoObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:AlkoApp/DB/DB.dart';

class Model extends ChangeNotifier {
  List<AlkoObject> alkoList = new List();
  List<String> listToFilterOn = new List();

  bool filterList = false;
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
}
