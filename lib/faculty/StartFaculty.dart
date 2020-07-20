import 'package:flutter/material.dart';

class StartPageFaculty extends StatelessWidget {
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
                child: RaisedButton(
                  child: Text(
                    'Login',
                  ),
                  color: Colors.blueGrey,
                  textColor: Colors.white,
                  padding: EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),              
                  onPressed: () {
                    Navigator.pushNamed(context, 'FacLog');
                  }
                ),
              ),
              SizedBox(
                   height:20.0,
              ),
              Center(
                child: RaisedButton(
                  child: Text(
                    'Signup',
                  ),
                  color: Colors.blueGrey,
                  textColor: Colors.white,
                  padding: EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),              
                  onPressed: () {
                    Navigator.pushNamed(context, 'FacSign');
                  }
                ),
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
