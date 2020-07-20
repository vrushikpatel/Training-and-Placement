import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainingandplacement/faculty/DetalisOfCompany.dart';

class ListOfPendingRequest extends StatefulWidget {
  @override
  _ListOfPendingRequestState createState() => _ListOfPendingRequestState();
}

class _ListOfPendingRequestState extends State<ListOfPendingRequest> {

  Future getPosts() async {
    var firestore=Firestore.instance;
    QuerySnapshot qn = await firestore.collection("RequestingCompanyDetails").getDocuments();
    return qn.documents;
  }
  navigateToDetails(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(post: post,)));
  }

  @override
  Widget build(BuildContext context) {
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
                      Navigator.pushNamed(context, 'FacWelcome');
                    }
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width)/4.5,
                ),
                Text( 'List Of company',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            child: FutureBuilder(
                future: getPosts(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: Text("Loading...."),
                    );
                  }
                  else{
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index){
                          return Card(
                            color: Colors.black12,
                            child:ListTile(
                              title: Text(snapshot.data[index].data["CompanyName"]),
                              onTap: () { navigateToDetails(snapshot.data[index]);
                              },
                            ),
                          );
                        }
                    );
                  }
                }
            ),
          ),
        ),
      ),
    );
  }
}

