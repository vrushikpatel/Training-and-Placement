import 'package:flutter/material.dart';

class InputFormDetails extends StatelessWidget {
  InputFormDetails({
      this.detail,
      this.passwordcheck = false,
      this.numberkeyboard = TextInputType.text,
      this.changeValue,
      this.validFunc,
    });
  final String detail;
  final bool passwordcheck;
  final TextInputType numberkeyboard;
  final Function changeValue;
  final Function validFunc;


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onChanged: changeValue,
      keyboardType: numberkeyboard,
      validator: validFunc,
      obscureText: passwordcheck,
      decoration: InputDecoration(
        labelText: detail,
//        hasFloatingPlaceholder: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
       ),
    );
  }
}


