import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({this.pressed,this.txt});
  final String txt;
  final Function pressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text( txt,
      ),
      color: Colors.blueGrey,
      textColor: Colors.white,
      padding: EdgeInsets.only(
          left: 15, right: 15, top: 10, bottom: 10
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: pressed,
    );
  }
}
