import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mojtam3/Lozalization/localizations.dart';
import 'package:mojtam3/model/provider/dataUser.dart';
import 'package:mojtam3/utillites/utillity_class.dart';


class PayPage2 extends StatefulWidget {
  final String Image_path;

  PayPage2(this.Image_path);

  @override
  _PayPage2State createState() => _PayPage2State();
}

class _PayPage2State extends State<PayPage2> {
  final _formKey = GlobalKey<FormState>();
    DataUser _dataUser = DataUser.instance;
  @override
  Widget build(BuildContext context) {
   
        return Form(
          key: _formKey,
          child: Scaffold(
        backgroundColor: Color(int.parse(  _dataUser.getKey(Utility.BackGroundColor),)),
            appBar: AppBar(
              backgroundColor: Colors.grey,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                AppLocalizations.of(context).lblConfirmpayment,
                style: TextStyle(fontFamily: "thin", fontSize: 14,color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 50, bottom: 30),
                        height: 80,
                        width: 200,
                        child: Image.asset(
                          widget.Image_path,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Text(
                        AppLocalizations.of(context).lblCardNumber,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "black",
                            color: Colors.teal[200]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        border: new Border.all(color: Colors.grey[300]),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context).lblCardNumber;
                          }

                          return null;
                        },

                        cursorColor: Colors.white,
                        showCursor: false,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "thin"),

                        //s textAlign: TextAlign.right,

                        decoration: InputDecoration.collapsed(
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: "thin"),
                          hintText: AppLocalizations.of(context).lblCardNumber,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Text(
                        AppLocalizations.of(context).lblNameOfCardOwner,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "black",
                            color: Colors.teal[200]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        border: new Border.all(color: Colors.grey[300]),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context)
                                .lblNameOfCardOwner;
                          }

                          return null;
                        },

                        cursorColor: Colors.white,
                        showCursor: false,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "thin"),

                        //s textAlign: TextAlign.right,

                        decoration: InputDecoration.collapsed(
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: "thin"),
                          hintText:
                              AppLocalizations.of(context).lblNameOfCardOwner,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Text(
                        AppLocalizations.of(context).lblExpiryDate,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "black",
                            color: Colors.teal[200]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        border: new Border.all(color: Colors.grey[300]),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context).lblExpiryDate;
                          }

                          return null;
                        },

                        cursorColor: Colors.white,
                        showCursor: false,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "thin"),

                        //s textAlign: TextAlign.right,

                        decoration: InputDecoration.collapsed(
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: "thin"),
                          hintText: AppLocalizations.of(context).lblExpiryDate,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Text(
                        AppLocalizations.of(context).lblSecretNumber,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "black",
                            color: Colors.teal[200]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        border: new Border.all(color: Colors.grey[300]),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context).lblSecretNumber;
                          }

                          return null;
                        },

                        cursorColor: Colors.white,
                        showCursor: false,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "thin"),

                        //s textAlign: TextAlign.right,

                        decoration: InputDecoration.collapsed(
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: "thin"),
                          hintText:
                              AppLocalizations.of(context).lblSecretNumber,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.only(
                            right: 15, left: 15, top: 10, bottom: 10),
                        width: MediaQuery.of(context).size.width * .6,
                        margin: EdgeInsets.only(top: 30),
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/Rectangle2.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Text(AppLocalizations.of(context).lblSave,
                            style: TextStyle(
                                fontFamily: "black", color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    
  }
}
