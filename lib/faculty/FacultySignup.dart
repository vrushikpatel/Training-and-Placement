import 'package:flutter/material.dart';
import '../components/formate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FacultySignupPage extends StatefulWidget {
  
  @override
  _FacultySignupPageState createState() => _FacultySignupPageState();
}

class _FacultySignupPageState extends State<FacultySignupPage> {

  //alert box
  Future<void> _showMyDialog( String e,bool flag) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kindly focus'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(e),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('close'),
              onPressed: () {
                if(flag){

                   Navigator.pushNamed(context, 'FacLog');
                 }
                else{
                Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }



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
                                  _showMyDialog('Signed up Successfull',true);
                                }
                              }
                              catch(e){
                                _showMyDialog(e.toString(),false);
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