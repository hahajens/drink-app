import 'package:AlkoApp/model/AlkoObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:AlkoApp/DB/DB.dart';

class Model extends ChangeNotifier {
  List<AlkoObject> _alkoList = new List();
  List<AlkoObject> _favoriteList = new List();

  int index;

  List get alkoList => _alkoList;
  List get favoriteList => _favoriteList;

  Model() {
    syncLists();
  }

  void syncLists() async {
    print("Loading...");
    _alkoList = await DB.getData();
    notifyListeners();
    print("DONE!");
  }

  void setListByIngredient(List listToFilterOn) async {
    if (listToFilterOn.length > 0) {
      _alkoList = await DB.getDataByIngredient(listToFilterOn);
      notifyListeners();
    } else {
      _alkoList = await DB.getData();
      notifyListeners();
    }
  }

  getIngredientsList() async {
    List<String> listOfIngredients = new List();
    listOfIngredients = await DB.getIngredientsList();
    return listOfIngredients;

    //Kan bugga med den andra index högre upp/Olle
    //Variabel, getter & setter för NavigationBar
    // int _currentIndex = 0;
    // get currentIndex => _currentIndex;

    // set currentIndex(int index) {
    //   _currentIndex = index;
    //   notifyListeners();

    // }
  }

  void addFavorite(AlkoObject drink) {
    favoriteList.add(drink);
    notifyListeners();
  }
}
