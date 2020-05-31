import 'package:flutter/material.dart';
import 'package:mojtam3/ApiRequests.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/models/conditionsModel.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/utillites/utillity_class.dart';
class condtions extends StatefulWidget {
  @override
  _condtionsState createState() => _condtionsState();
}

class _condtionsState extends State<condtions> {
  
 DataUser _dataUser = DataUser.instance;
 ApiRequests apiRequests = new ApiRequests();
bool is_loding = true; 
ConditionModel conditions;
@override
  void initState() {
    // TODO: implement initState
 //  is_loding = true;
    apiRequests.getConditions().then((value) {
      print("---------------------------tiger---------------");
      print(value);
      setState(() {
        conditions = value;
        is_loding = false;
      });
    });



    super.initState();
  }
  @override
  Widget build(BuildContext context) {

  
      return Scaffold(
        backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
             AppLocalizations.of(context).lblTermsandConditions,
            style: TextStyle(fontFamily: "thin", fontSize: 18,color: Colors.white),
            
          ),
        ),
        body:is_loding?CircularProgressIndicator(backgroundColor: Colors.teal,): SingleChildScrollView(
          child:conditions!=null? Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
            child:Text(conditions.settings.policy,textAlign: TextAlign.center,style: TextStyle(fontFamily: "thin",fontSize: 18,color: Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),)
            ),
          ):Center(child: Text("تاكد من الاتصال من الانترنت",style: TextStyle(    color:  Color(int.parse(  _dataUser.getKey(Utility.FontColor),))),)),
        ),

      );
 
  }
}