import 'dart:convert';

import 'package:covid_tracker/dataSource.dart';
import 'package:covid_tracker/pages/country.dart';
import 'package:covid_tracker/panels/InfoPanel.dart';
import 'package:covid_tracker/panels/mostAffectedCountry.dart';
import 'package:covid_tracker/panels/worldWidePanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  List countryData;
  fetchWorldWideData()async{
    var url = Uri.parse("https://corona.lmao.ninja/v2/all?yesterday");
    http.Response response = await http.get(url);
    setState(() {
      worldData = json.decode(response.body);
    });
  }
  fetchCountryData()async{
    var url = Uri.parse("https://corona.lmao.ninja/v2/countries?yesterday&sort=deaths");
    http.Response response = await http.get(url);
    setState(() {
      countryData = json.decode(response.body);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
    title: Text("Covid-19 Tracker",),
    ),
    body: SingleChildScrollView(child:Column(
      children: [
        Container(
          height: 100,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          color: Colors.green[100],
          child: Text('Stay home, Stay Safe,'
              'Keep your mask On',style: TextStyle(color: Colors.green[800],fontSize: 16,),),
        ),
        Padding(
          padding:EdgeInsets.all(10) ,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('WorldWide',style: TextStyle(fontWeight: FontWeight.bold,fontSize:24),) ,
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>country()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:primaryBlack,
                    borderRadius: BorderRadius.circular(15),
                  ),
                    padding: EdgeInsets.all(10),
                    child: Text('Regional',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize:16),)),
              )],
          )
        ),
        worldData==null?CircularProgressIndicator():worldWidePanel(worldData: worldData,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Text('Most Affected Countries',style: TextStyle(fontWeight: FontWeight.bold,color:primaryBlack,fontSize:16)),
        ),
      SizedBox(height: 10,),
      countryData==null?Container():mostAffectedPanel(countryData: countryData,),
      infoPanel(),
        SizedBox(height: 50,),
      ]
    )),
    );
  }
}
