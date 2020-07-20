import 'package:flutter/material.dart';
import '../components/formate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  //alert box
  Future<void> _showMyDialog( String e,bool flag) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kidly Focus'),
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
                  Navigator.popAndPushNamed(context, 'StdWelcome');
                }
                else{
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
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
//                                  _showMyDialog('Loged Inn Successfull',true);
                                Fluttertoast.showToast(msg: 'Logedd Inn successfull',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                );

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