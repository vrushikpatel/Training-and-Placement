import 'package:flutter/material.dart';
import '../components/formate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CompanyForm extends StatefulWidget {
  
  @override
  _CompanyFormState createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {

  String studentId;
  String companyName;
  String companyWeb;
  String companyAddress;
  var numberOfEmployee;
  var numberOfBranches;
  String addressOfHeadOffice;
  String contactPersonName;
  var contactPersonNumber;
  String contactPersonEmail;
  String nameOfHR;
  var numberofHR;
  String hREmail;
  String technology;
  String reason;
  var contactNumber;
  final Firestore  _firestore= Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'TNP',
                style: TextStyle(
                  color: Colors.black,
                ),
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
      children: <Widget>[
        Container(
          child: Container(
            child: Padding(padding: const EdgeInsets.all(5.0),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Company Details",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:10,
                    ),
                    InputFormDetails(
                      detail: "Student Id",
                      changeValue: (value){
                        studentId=value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "Company Name",
                      changeValue: (value){
                        companyName=value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "Company Website(URL)",
                      changeValue: (value){
                        companyWeb=value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "Company Address",
                      changeValue: (value){
                        companyAddress=value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "Number of Employee",
                      numberkeyboard: TextInputType.number,
                      changeValue: (value){
                        numberOfEmployee=value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "Number of Branch",
                      numberkeyboard: TextInputType.number,
                      changeValue: (value){
                        numberOfBranches=value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "Head Office Address",
                      changeValue: (value){
                          addressOfHeadOffice =value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "Contact Person Name",
                       changeValue: (value){
                          contactPersonName =value;
                      },
                  
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "Contact Person Number",
                      numberkeyboard: TextInputType.number,
                      changeValue: (value){
                          contactNumber =value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "Contact Person Email",
                      numberkeyboard: TextInputType.emailAddress,
                      changeValue: (value){
                          contactPersonEmail =value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "HR Name",
                      changeValue: (value){
                          nameOfHR =value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "HR phone Number",
                      numberkeyboard: TextInputType.number,
                      changeValue: (value){
                          numberofHR =value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "HR Email",
                      numberkeyboard: TextInputType.emailAddress,
                      changeValue: (value){
                          hREmail =value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "Technology (Company working on)",
                      changeValue: (value){
                          technology =value;
                      },
                    ),
                    SizedBox(
                      height:5,
                    ),
                    InputFormDetails(
                      detail: "Reason to choose this Company",
                      changeValue: (value){
                          reason =value;
                      },
                    ),
                    SizedBox(
                      height:25,
                    ),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(
                          child: FlatButton(
                            child: Text("Submit"),
                            color: Color(0xFF4B9DFE),
                            textColor: Colors.white,
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () async{
                                 await _firestore.collection(
                                    'RequestingCompanyDetails').document(companyName).setData({ 
                                      'StudentId':studentId,
                                      'CompanyName':companyName ,
                                      'CompanyWebsite': companyWeb,
                                      'CompanyAddress': companyAddress,
                                      'NumberOfEmployee': numberOfEmployee,
                                      'NumberOfBranch': numberOfBranches,
                                      'HeadOfficeAddress':addressOfHeadOffice,
                                      'ContactPersonName':contactPersonName,
                                      'HRName':nameOfHR,
                                      'HRPhoneNumber': numberofHR,
                                      'HREmail':hREmail,
                                      'Technology': technology,
                                      'ReasonToChooseThisCompany':reason, 
                                    });
                                Fluttertoast.showToast(msg: 'Submitted successfully',
                                   toastLength: Toast.LENGTH_SHORT,
                                   gravity: ToastGravity.BOTTOM,
                                   timeInSecForIosWeb: 1,
                                   backgroundColor: Colors.white12,
                                   textColor: Colors.white,
                                   fontSize: 16.0,
                                 );
                                Navigator.popAndPushNamed(context, 'StdWelcome');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ),
          ),
        ),
      ],
    );
  }
}