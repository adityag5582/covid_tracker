import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class country extends StatefulWidget {
  @override
  _countryState createState() => _countryState();
}

class _countryState extends State<country> {

  List countryData;
  fetchCountryData()async{
    var url = Uri.parse("https://corona.lmao.ninja/v2/countries?yesterday&sort");
    http.Response response = await http.get(url);
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Country Wise Stats'),),
      body:countryData==null?CircularProgressIndicator():ListView.builder( itemBuilder: (context, index) {
        return Card(
          child: Container(
            height: 130,
            margin: EdgeInsets.symmetric( vertical: 10),
            child: Row(
              children: <Widget>[
                Container(
                  width: 200,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        countryData[index]['country'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Image.network(
                        countryData[index]['countryInfo']['flag'],
                        height: 50,
                        width: 60,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      width: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'CONFIRMED:' +
                                countryData[index]['cases'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          Text(
                            'ACTIVE:' +
                                countryData[index]['active'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          Text(
                            'RECOVERED:' +
                                countryData[index]['recovered'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          Text(
                            'DEATHS:' +
                                countryData[index]['deaths'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).brightness==Brightness.dark?Colors.grey[100]:Colors.grey[900]),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
        itemCount: countryData == null ? 0 : countryData.length,),
    );


  }
}
