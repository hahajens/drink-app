import 'package:flutter/material.dart';
import 'package:AlkoApp/model/NavigationBar.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}