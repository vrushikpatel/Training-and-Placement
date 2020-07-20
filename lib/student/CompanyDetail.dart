import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentCompanyDetail extends StatefulWidget {
  final DocumentSnapshot post;
  StudentCompanyDetail({this.post});
  @override
  _StudentCompanyDetailState createState() => _StudentCompanyDetailState();
}

class _StudentCompanyDetailState extends State<StudentCompanyDetail> {

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
                DisplayList(widget: widget,txt: "CompanyName",),
                DisplayList(widget: widget,txt: "CompanyWebsite",),
                DisplayList(widget: widget,txt: "CompanyAddress",),
                DisplayList(widget: widget,txt: "NumberOfEmployee",),
                DisplayList(widget: widget,txt: "NumberOfBranch",),
                DisplayList(widget: widget,txt: "HeadOfficeAddress",),
                DisplayList(widget: widget,txt: "ContactPersonName",),
                DisplayList(widget: widget,txt: "HRName",),
                DisplayList(widget: widget,txt: "HREmail",),
                DisplayList(widget: widget,txt: "HRPhoneNumber",),
                DisplayList(widget: widget,txt: "Technology",),
                DisplayList(widget: widget,txt: "ReasonToChooseThisCompany",),
                SizedBox(
                  height:20,
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
class DisplayList extends StatelessWidget {
  const DisplayList({
    Key key,
    @required this.widget,
    this.txt,
  }) : super(key: key);

  final StudentCompanyDetail widget;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
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
