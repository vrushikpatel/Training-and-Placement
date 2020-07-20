import 'package:flutter/material.dart';
import 'package:trainingandplacement/components/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FacultyWelcome extends StatelessWidget {
  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  Text( 'TNP',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                                 
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.signOutAlt),
                    onPressed: () {
                     _auth.signOut();
                     Navigator.popAndPushNamed(context, 'FacLog');
                    }
                 ),
              ],
            ),

          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Button(txt: 'Panding Request for company verification',
                  pressed: (){
                  Navigator.pushNamed(context, 'PendingRequest');
                },),
              ),
              SizedBox(
                   height:20.0,
              ),
              Center(
                child: Button(txt: 'Panding Request for NOC and LOR',
                  pressed: (){
                  Navigator.pushNamed(context, null);
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