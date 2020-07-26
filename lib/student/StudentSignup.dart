import 'package:flutter/material.dart';
import '../components/formate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:string_validator/string_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StudentSignupPage extends StatefulWidget {
  @override
  _StudentSignupPageState createState() => _StudentSignupPageState();
}

class _StudentSignupPageState extends State<StudentSignupPage> {

  String selectedBranch = 'CE';
  String fN;
  String email;
  String pass;
  String lN;
  var batcH;
  String rollNo;
  var contactNumber;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final Firestore  _firestore= Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'TNP'
              )
            ),
            backgroundColor: Colors.orange,
          ),

          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
            //lowerHalf(context),
            //upperHalf(context),
                signupcard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
    Widget signupcard(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          child: Container(
            child: Padding(padding: const EdgeInsets.all(5.0),
            child: Form(
              key: _formKey,
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height:10,
                      ),
                      InputFormDetails(
                        detail: "Your First Name",
                        changeValue: (value){
                          fN = value;
                        },
                        validFunc: (value){
                          if(!isAlpha(value)){
                            return "First name contains only Letter";
                          }
                        },
                      ),
                      SizedBox(
                        height:5,
                      ),
                      InputFormDetails(
                        detail: "Your Last Name",
                        changeValue: (value){
                          lN = value;
                        },
                        validFunc: (value){
                          if(!isAlpha(value)){
                            return "Last name contains only Letter";
                          }
                        },
                      ),
                      SizedBox(
                        height:5,
                      ),
                      InputFormDetails(
                        detail: "Batch",
                        changeValue: (value){
                          batcH = value;
                        },
                         validFunc: (value){
                          if(!isNumeric(value)){
                            return "Invalid Contact Number";
                          }
                        },
                      ),
                      SizedBox(
                        height:5,
                      ),
                       InputFormDetails(
                        detail: "Roll Number",
                        changeValue: (value){
                          rollNo=value.toUpperCase();
                        },
                      ),
                       SizedBox(
                        height:5,
                      ),
                      InputFormDetails(
                        detail: "Email",
                        numberkeyboard: TextInputType.emailAddress,
                        changeValue: (value){
                          email=value;
                        },
                      ),
                      SizedBox(
                        height:5,
                      ),
                      InputFormDetails(
                        detail: "Password",
                        passwordcheck: true,
                        changeValue: (value){
                          pass=value;
                        }
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InputFormDetails(
                        detail: "Contact No.",
                        numberkeyboard: TextInputType.number,
                        changeValue: (value){
                          contactNumber = value;
                          print(contactNumber);
                        },
                        validFunc: (value){
                          if(!isNumeric(value)){
                            return "Invalid Contact Number";
                          }
                        },
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Select Your Branch.',
                              style: TextStyle(
                                fontSize: 23,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          DropdownButton(
                        value: selectedBranch,
                        items: [
                        DropdownMenuItem(
                          child: Text('CE'),
                          value: 'CE',
                        ),
                        DropdownMenuItem(
                          child: Text('CSE'),
                          value: 'CSE',
                        ),
                        DropdownMenuItem(
                          child: Text('IT'),
                          value: 'IT',
                        ),
                      ],
                      onChanged: (value)
                      {
                        setState(() {
                          selectedBranch = value;
                        });
                      }),
                        ],
                      ),

                      SizedBox(
                        height:5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                            child: RaisedButton(
                              child: Text("Sign Up"),
                              color: Color(0xFF4B9DFE),
                              textColor: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 30, right: 30, top: 10, bottom: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () async{

                                if(_formKey.currentState.validate()){
                                  print('String validate successs fully');
                                  try {
                                    final user = await _auth
                                        .createUserWithEmailAndPassword(
                                        email: email, password: pass);
                                    await _firestore.collection(
                                        'SignupStudent').document(rollNo).setData(
                                        { 'FirstName': fN,
                                          'LastName': lN,
                                          'Batch': batcH,
                                          'Roll Number':rollNo,
                                          'Email': email,
                                          'Password': pass,
                                          'ContactNumber': contactNumber,
                                          'Branch': selectedBranch,
                                        });
                                    if (user != null) {
                                      Fluttertoast.showToast(msg: 'Signed up Successfully',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.white12,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      Navigator.pushNamed(context, 'StdLog');
                                    }
                                  }
                                  catch(e){
                                    var temp=e.toString().split(',');
                                    var error=temp[1].split(',');
                                    print(error[0]);
                                    Fluttertoast.showToast(msg: error[0],
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.white,
                                      textColor: Colors.red,
                                      fontSize: 16.0,
                                    );
                                  }
                                }
                              },
                            ),

                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            textColor: Colors.black87,
                            child: Text("Log In"),
                            onPressed: () {
                              Navigator.pushNamed(context, 'StdLog');
                            }
                          )
                        ],
                      )
                    ],
                  ),
            ),
            ),
          ),
        ),
      ],
    );
  }
}

