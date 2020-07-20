import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainingandplacement/components/button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DetailsPage extends StatefulWidget {
  final DocumentSnapshot post;
  DetailsPage({this.post});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>{


  //function to delete the data
  void  deleteCompanyDetail(String compName) async{
    final _firestore=Firestore.instance;
     await _firestore.collection('RequestingCompanyDetails').document(compName).delete();
    print('COmpant deletedd $compName');
  }
  
  //function to add data into final  Databse
  void addcompanyDetail()async{
    final _firestore=Firestore.instance;
    await _firestore.collection('VerifiedCompanyName').document(widget.post.data["CompanyName"]).
    setData({
      'CompanyName':widget.post.data['CompanyName'] ,
      'CompanyWebsite': widget.post.data['CompanyWebsite'],
      'CompanyAddress': widget.post.data['CompanyAddress'],
      'NumberOfEmployee': widget.post.data['NumberOfEmployee'],
      'NumberOfBranch': widget.post.data['NumberOfBranch'],
      'HeadOfficeAddress':widget.post.data['HeadOfficeAddress'],
      'ContactPersonName':widget.post.data['ContactPersonName'],
      'HRName':widget.post.data['HRName'],
      'HRPhoneNumber': widget.post.data['HRPhoneNumber'],
      'HREmail':widget.post.data['HREmail'],
      'Technology': widget.post.data['Technology'],
      'ReasonToChooseThisCompany':widget.post.data['ReasonToChooseThisCompany'],
    });
    print('Data Successfully loaded..............');

    deleteCompanyDetail(widget.post.data['CompanyName']);

  }
  

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Row(
              children: <Widget>[
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.backward),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width)/3.5,
                ),
                Text( widget.post.data["CompanyName"],
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                CompanyDetail(widget: widget,txt: "StudentId",),
                CompanyDetail(widget: widget,txt: "CompanyName",),
                CompanyDetail(widget: widget,txt: "CompanyWebsite",),
                CompanyDetail(widget: widget,txt: "CompanyAddress",),
                CompanyDetail(widget: widget,txt: "NumberOfEmployee",),
                CompanyDetail(widget: widget,txt: "NumberOfBranch",),
                CompanyDetail(widget: widget,txt: "HeadOfficeAddress",),
                CompanyDetail(widget: widget,txt: "ContactPersonName",),
                CompanyDetail(widget: widget,txt: "HRName",),
                CompanyDetail(widget: widget,txt: "HREmail",),
                CompanyDetail(widget: widget,txt: "HRPhoneNumber",),
                CompanyDetail(widget: widget,txt: "Technology",),
                CompanyDetail(widget: widget,txt: "ReasonToChooseThisCompany",),
                SizedBox(
                  height:20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Button(txt:'Approve',pressed: (){
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "WARNING",
                        desc: "This action can't undo!!",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              addcompanyDetail();
                              Navigator.pushNamed(context,'FacWelcome');
                            },
                            color: Color.fromRGBO(0, 179, 134, 1.0),
                          ),
                          DialogButton(
                            child: Text(
                              "CANCLE",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(116, 116, 191, 1.0),
                              Color.fromRGBO(52, 138, 199, 1.0)
                            ]),
                          )
                        ],
                      ).show();
                    }, ),
                    Button(txt:'Decline',pressed: (){
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "CONFIRM ACTION",
                        desc: "This action can't undo!!",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              deleteCompanyDetail(widget.post.data['CompanyName']);
                              Navigator.pushNamed(context,'FacWelcome');
                              },
                            color: Color.fromRGBO(0, 179, 134, 1.0),
                          ),
                          DialogButton(
                            child: Text(
                              "CANCLE",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(116, 116, 191, 1.0),
                              Color.fromRGBO(52, 138, 199, 1.0)
                            ]),
                          )
                        ],
                      ).show();
                    }, ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//-----------------------------------------------------------------
//Company Details in Pending list

class CompanyDetail extends StatelessWidget {
  const CompanyDetail({
    Key key,
    @required this.widget,
    this.txt,
  }) : super(key: key);

  final DetailsPage widget;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 50,
      color: Colors.amber[200],
      child: Center(
        child: Row(
          children: <Widget>[
            Text(txt),
            SizedBox(width: 20,),
            Text(' : '),
            Text(widget.post.data[txt]),
          ],
        ),
      ),
    );
  }
}
