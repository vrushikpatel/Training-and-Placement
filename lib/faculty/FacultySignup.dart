import 'package:flutter/material.dart';
import '../components/formate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FacultySignupPage extends StatefulWidget {
  
  @override
  _FacultySignupPageState createState() => _FacultySignupPageState();
}

class _FacultySignupPageState extends State<FacultySignupPage> {

  String selectedBranch = 'CE';
  String fN;
  String email;
  String pass;
  String lN;
  String empId;
  var contactNumber;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final Firestore  _firestore= Firestore.instance;

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: Container(
            child: Padding(padding: const EdgeInsets.all(5.0),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      height:15,
                    ),
                    InputFormDetails(
                      detail: "Your First Name",
                        changeValue: (value){
                          fN = value;
                        },
                    ),
                    SizedBox(
                      height:10,
                    ),
                    InputFormDetails(
                      detail: "Your Last Name",
                        changeValue: (value){
                          lN = value;
                        },
                    ),
                    SizedBox(
                      height:10,
                    ),
                    InputFormDetails(
                      detail: "Empid",
                      changeValue: (value){
                        empId = value;
                      },
                    ),
                    SizedBox(
                      height:10,
                    ),
                    InputFormDetails(
                      detail: "Email",
                      numberkeyboard: TextInputType.emailAddress,
                      changeValue: (value){
                        email = value;
                      },
                    ),
                    SizedBox(
                      height:10,
                    ),
                    InputFormDetails(
                      detail: "Password",
                      passwordcheck: true,
                      changeValue: (value){
                        pass = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputFormDetails(
                      detail: "Contact No.",
                      numberkeyboard: TextInputType.number,
                      changeValue: (value){
                        contactNumber = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
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
                      height:15,
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
                              try {
                                final user = await _auth
                                    .createUserWithEmailAndPassword(
                                    email: email, password: pass);
                                 await _firestore.collection(
                                    'SignupFaculty').document(empId).setData(
                                    { 'FirstName': fN,
                                      'LastName': lN,
                                      'Employee Id':empId,
                                      'Email': email,
                                      'Password': pass,
                                      'ContactNumber': contactNumber,
                                      'Branch': selectedBranch,
                                    });
                                if (user != null) {
                                  Fluttertoast.showToast(msg: 'Signed up Successfull',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.white12,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  Navigator.pushNamed(context, 'FacLog');
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
                            Navigator.pushNamed(context, 'FacLog');
                          }
                        )
                      ],
                    )
                  ],
                ),
            ),
          ),
        ),
      ],
    );
  }
}