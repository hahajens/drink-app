import 'package:AlkoApp/model/AlkoObject.dart';
import 'package:AlkoApp/model/IngredientObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:AlkoApp/DB/DB.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Model extends ChangeNotifier {
  List<AlkoObject> _alkoList = new List();
  List<AlkoObject> _favoriteList = new List();
  List<AlkoObject> _popularList = new List();
  List<AlkoObject> _randomList = new List();
  List listToFilterOn = new List();
  bool _isLoading = false;

  List get alkoList => _alkoList;
  List get favoriteList => _favoriteList;
  List get popularList => _popularList;
  List get randomList => _randomList;
  bool get isLoading => _isLoading;

  Color _filterColor;

  void setFilterColor(object) {
    if (object.getCheck == false) {
      object.setCheck(true);
      notifyListeners();
    } else {
      object.setCheck(false);
      notifyListeners();
    }
  }

  Color getFilterColor(object) {
    if (object.getCheck == false) {
      _filterColor = Colors.grey[300];
      return _filterColor;
    } else {
      _filterColor = Colors.grey[600];
      return _filterColor;
    }
  }

  Model() {
    syncLists();
    popular();
  }

  void syncLists() async {
    print("Loading...");
    _isLoading = true;
    notifyListeners();
    _alkoList = await DB.getData();
    _isLoading = false;
    notifyListeners();
    print("DONE!");
  }

  void setListByIngredient(List listToFilterOn, context) async {
    _isLoading = true;
    notifyListeners();
    if (listToFilterOn.length > 0) {
      _alkoList = await DB.getDataByIngredient(listToFilterOn, context);
      _isLoading = false;
      notifyListeners();
    } else {
      _alkoList = await DB.getData();
      notifyListeners();
    }
  }

  getIngredientsList() async {
    _isLoading = true;
    notifyListeners();
    List<IngredientObject> listOfIngredients = new List();
    listOfIngredients = await DB.getIngredientsList();
    _isLoading = false;
    notifyListeners();
    return listOfIngredients;
  }

  myFlutterToast(input) {
    return Fluttertoast.showToast(
      msg: input,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey.shade300,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  //Kan bugga med den andra index högre upp/Olle
  //Variabel, getter & setter för NavigationBar
  int _currentIndex = 0;
  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // bool getFavorite(index) {
  //   return favoriteList[index].isFavorite;
  // }

  void editFavorite(AlkoObject drink) {
    if (favoriteList.contains(drink)) {
      drink.isFavorite = false;
      removeFavorite(drink);
      myFlutterToast('Removed from favorites');
    } else {
      drink.isFavorite = true;
      favoriteList.add(drink);
      myFlutterToast('Added to favorites');
    }
    notifyListeners();
  }

  void removeFavorite(AlkoObject drink) {
    drink.isFavorite = false;
    favoriteList.remove(drink);
    notifyListeners();
  }

  Icon getFavoriteIcon(AlkoObject drink) {
    if (drink.isFavorite == true) {
      var filledIcon = Icon(Icons.favorite, color: Colors.white);
      return filledIcon;
    } else {
      var outLinedIcon = Icon(Icons.favorite_border_outlined, color: Colors.white);
      return outLinedIcon;
    }
  }

  void setFavoriteIcon(AlkoObject drink) {
    if (drink.isFavorite == false) {
      drink.isFavorite = true;
    } else {
      drink.isFavorite = false;
    }
    notifyListeners();
  }

  // void setFavorite(AlkoObject drink, bool input) {
  //   drink.isFavorite = input;
  //   getFavorite(drink);
  // }

  //Används för att hämta de mest populära, som visas på startView
  void popular() async {
    _isLoading = true;
    notifyListeners();
    _popularList = await DB.getPopularDrinks();
    _isLoading = false;
    notifyListeners();
    print("test");
  }

  //Används för att hämta en random, används på startview
  void random() async {
    _isLoading = true;
    notifyListeners();
    _randomList = await DB.getRandomDrink();
    _isLoading = false;
    notifyListeners();
    print("test");
  }
}
