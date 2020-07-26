import 'package:flutter/material.dart';
import '../components/formate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentLoginPage(),
    );
  }
}
class StudentLoginPage extends StatefulWidget {
  @override
  _StudentLoginPageState createState() => _StudentLoginPageState();
}
class _StudentLoginPageState extends State<StudentLoginPage> {

  //function for checking student
  void checkStudent(var email)async{
    final _firestore=Firestore.instance;
    bool checke=false;
    List<String> emailslist=[];
    final id= await _firestore.collection('SignupStudent').getDocuments();
    for(var mail in id.documents){
      emailslist.add(mail.data['Email']);
    }
    print(emailslist);
    for(var ids in emailslist){
      if(email==ids){
        checke=true;
        Fluttertoast.showToast(msg: 'Log In successfull',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white12,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.popAndPushNamed(context, 'StdWelcome');// navigation if login successful
      }
    }
    if(!checke){
      Fluttertoast.showToast(msg: 'You are not authorised in student Log in',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16.0,
      );
    }
  }

//declaration part
  final _auth=FirebaseAuth.instance;
  String email;
  String password;
  double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'TNP'
          ), 
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            loginCard(context),
          ],
        ),
      ),
    );
  }
  Widget loginCard(BuildContext context) {
      return Column(
        children: <Widget>[
          Container(
            
            margin: EdgeInsets.only(top: screenHeight /5),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "S Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InputFormDetails(
                      detail: "Email",
                      numberkeyboard: TextInputType.emailAddress,
                      changeValue: (value){
                        email=value;
                      },
                    ),
                    SizedBox(
                      height:10,
                    ),
                    InputFormDetails(
                      detail: "Password",
                      passwordcheck: true,
                        changeValue: (value){
                          password=value;
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(
                          child: RaisedButton(
                            child: Text("Login"),
                            color: Color(0xFF4B9DFE),
                            textColor: Colors.white,
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: ()async {

                              try {
                                final currentUser = await _auth.signInWithEmailAndPassword(
                                    email: email, password: password);
                                if (currentUser != null) {
                                  checkStudent(email);
                                }
                              }

                              catch(e){
                                var temp=e.toString().split(',');
                                var error=temp[1].split(',');
                                print(error[0]);
                                Fluttertoast.showToast(msg:error[0] ,
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
                        Center(
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text("Forgot Password ?"),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                           Navigator.pushNamed(context, 'StdSign');
                          },
                        textColor: Colors.black87,
                        child: Text("Create Account"),
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