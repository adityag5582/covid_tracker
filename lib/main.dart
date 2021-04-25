import 'package:covid_tracker/dataSource.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/homePage.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily:'Circular',
      primaryColor: primaryBlack,
    ),
    home:HomePage(),
  ));
}