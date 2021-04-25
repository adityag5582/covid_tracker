import 'package:covid_tracker/dataSource.dart';
import 'package:flutter/material.dart';

class faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQS'),),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context,index){
        return ExpansionTile(title: Text(DataSource.questionAnswers[index]['question'],style: TextStyle(fontWeight: FontWeight.bold),),
          children: [Text(DataSource.questionAnswers[index]['answer']),],);
      }),
    );
  }
}
