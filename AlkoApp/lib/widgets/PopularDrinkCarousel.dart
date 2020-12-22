import 'package:AlkoApp/model/Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularDrinkCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Popular Drinks',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                Provider.of<Model>(context, listen: false).alkoList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/DrinkView',
                      arguments: Provider.of<Model>(context, listen: false)
                          .alkoList[index].idDrink);
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: 210.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 15.0,
                        child: Container(
                          height: 120.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Ingredients',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${Provider.of<Model>(context, listen: false).alkoList[index].strIngredient1}, ${Provider.of<Model>(context, listen: false).alkoList[index].strIngredient2}, ${Provider.of<Model>(context, listen: false).alkoList[index].strIngredient3}, ${Provider.of<Model>(context, listen: false).alkoList[index].strIngredient4}, ${Provider.of<Model>(context, listen: false).alkoList[index].strIngredient5}, ${Provider.of<Model>(context, listen: false).alkoList[index].strIngredient6}, ${Provider.of<Model>(context, listen: false).alkoList[index].strIngredient7}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: Provider.of<Model>(context, listen: false)
                                  .alkoList[index]
                                  .strDrinkThumb,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 180.0,
                                  image: NetworkImage(
                                      Provider.of<Model>(context, listen: false)
                                          .alkoList[index]
                                          .strDrinkThumb),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 170,
                                    child: Text(
                                      "${Provider.of<Model>(context, listen: false).alkoList[index].strDrink}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
