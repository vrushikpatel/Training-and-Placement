import 'package:flutter/material.dart';
import 'company/CompanyForm.dart';
import 'faculty/List.dart';
import 'faculty/StartFaculty.dart';
import 'faculty/FacultyLogin.dart';
import 'student/StartStudent.dart';
import 'student/StudentLogin.dart';
import 'student/StudentSignup.dart';
import 'student/StudentWelcome.dart';
import 'faculty/FacultySignup.dart';
import 'faculty/FacultyWelcome.dart';
import 'StartPage.dart';
import 'faculty/DetalisOfCompany.dart';
import 'student/VerifiedCompanydisplay.dart';
import 'student/CompanyDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ), 
      initialRoute: 'StartPage' ,
      routes: {
        'StartPage': (context)=>StartPage(),
        'StartPageStudent' : (context) => StartPageStudent(),
        'StartPageFaculty' : (context) => StartPageFaculty(),
        'StdLog' : (context) => StudentLoginPage(),
        'StdSign' : (context)=> StudentSignupPage(),
        'StdWelcome' : (context)=> StudentWelcome(),
         'ComForm' :(context) => CompanyForm(),
         'FacLog' : (context) => FacultyLoginPage(),
        'FacSign' : (context)=> FacultySignupPage(),
        'FacWelcome' : (context)=> FacultyWelcome(),
        'PendingRequest' : (context)=>ListOfPendingRequest(),
        'DetailsPage' : (context)=>DetailsPage(),
        'StudentCompanyDisplay': (context)=>VerifiedCompanydisplay(),
        'StudentCompanyDisplayDetail' : (context)=>StudentCompanyDetail(),
      },
    );
  }
}
