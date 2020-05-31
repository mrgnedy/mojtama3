import 'package:flutter/material.dart';
import 'package:mojtam3/Lozalization/localizations.dart';

class AddPerson extends StatefulWidget {
  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "شباب السعير :)",
          style:
              TextStyle(fontSize: 20, fontFamily: "thin", color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Image.asset("assets/images/menu.png"),
          )
        ],
        //todo need to fix search how to max leading width
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "الامس",
                style: TextStyle(
                    fontSize: 18, fontFamily: "thin", color: Colors.black38),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 190,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (BuildContext contect, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 12, right: 12, left: 12, bottom: 12),
                      child: Row(
                        children: <Widget>[
                          ClipOval(
                              child: Image.asset(
                            "assets/images/profile.jpg",
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          )),
                          Flexible(
                            child: Container(
                                margin: EdgeInsets.only(right: 8, left: 8),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  "هذا النص مثال للنص يمكن ان يستبدل ف نفس",
                                  style: TextStyle(fontSize: 10),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              "11.25 pm",
                              style:
                                  TextStyle(fontFamily: "thin", fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              // height: 50,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 10, bottom: 10),

              margin: EdgeInsets.only(left: 12, right: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Rectangle2.png"),
                    fit: BoxFit.fill),
              ),
              // alignment: Alignment.center,
              // color: Colors.red,
              child: Text(AppLocalizations.of(context).lblAddPerson,
                  style: TextStyle(fontFamily: "black", color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
