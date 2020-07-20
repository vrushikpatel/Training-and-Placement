import 'package:flutter/material.dart';
import 'faculty/StartFaculty.dart';
import 'components/button.dart';

class StartPage extends StatelessWidget {
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
                child: Button(txt:'Student' , pressed: (){
                  Navigator.pushNamed(context, 'StartPageStudent');
                },),
              ),
              SizedBox(
                   height:20.0,
              ),
              Center(
                child: Button(txt: 'Faculty',pressed: (){
                  Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => StartPageFaculty(),),
                  );
                },),
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





