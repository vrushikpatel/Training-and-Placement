import 'package:flutter/material.dart';
import 'package:trainingandplacement/components/button.dart';
class StartPageStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'TNP'
              ), 
            ),
            backgroundColor: Colors.orange,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Button(txt:'Login',pressed: (){
                   Navigator.pushNamed(context, 'StdLog');
                },),
              ),
              SizedBox(
                   height:20.0,
              ),
              Center(
                child: Button(txt: 'Signup',pressed: (){
                Navigator.pushNamed(context, 'StdSign');
                },)
              ),
              SizedBox(
                   height:20.0,
              ),
            ],
          ) ,
        ),
      ),
    );
  }
}





