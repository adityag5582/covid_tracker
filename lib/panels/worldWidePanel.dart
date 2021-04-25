import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class worldWidePanel extends StatelessWidget {

  final Map worldData;

  const worldWidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
        children: [
          statusPanel(
            title:'CONFIRMED',
            panelColor:Colors.red[100],
            textColor:Colors.red,
            count:worldData['cases'].toString(),
          ),
          statusPanel(
            title:'ACTIVE',
            panelColor:Colors.blue[100],
            textColor:Colors.blue,
            count:worldData['active'].toString(),
          ),
          statusPanel(
            title:'RECOVERED',
            panelColor:Colors.orange[100],
            textColor:Colors.orange,
            count:worldData['recovered'].toString(),
          ),
          statusPanel(
            title:'DEATHS',
            panelColor:Colors.grey[100],
            textColor:Colors.grey,
            count:worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class statusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  statusPanel({Key key,this.panelColor,this.textColor,this.title,this.count}):super(key:key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(5),
      height: 80,width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textColor),),
          Text(count,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textColor)),
        ],
      ),
    );
  }
}

