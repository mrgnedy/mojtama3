// import 'package:flutter/material.dart';
// import 'package:mojtam3/ApiRequests.dart';
// import 'package:mojtam3/Lozalization/localizations.dart';
// import 'package:mojtam3/Widget/ids_item.dart';
// import 'package:mojtam3/model/models/idesModel.dart';
// import 'package:mojtam3/model/provider/design.dart';
// import 'package:mojtam3/screens/TabsPages/main_page_tab/market_page_pro/pay_page.dart';
// import 'package:mojtam3/utillites/animator.dart';
// import 'package:provider/provider.dart';

// class BuyIdsRoomPage extends StatefulWidget {
//   @override
//   _BuyIdsRoomPageState createState() => _BuyIdsRoomPageState();
// }

// class _BuyIdsRoomPageState extends State<BuyIdsRoomPage> {
//   ApiRequests apiRequests = new ApiRequests();
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Design>(
//       builder: (context, ui, child) {
//         return Scaffold(
//           backgroundColor: ui.coloreOFbackground,
//           appBar: AppBar(
//             backgroundColor: Colors.grey[800],
//             leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 size: 30,
//                 color: Colors.white,
//               ),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             title: Text(
//               AppLocalizations.of(context).lblBuyIDs,
//               style: TextStyle(fontFamily: "thin", fontSize: 18,color: Colors.white),
//             ),
//           ),
//           body: FutureBuilder<IdesModel>(
//               future: apiRequests.getRoomids(),
//               builder: (context,snapshot)
//               {
//                 if (snapshot.connectionState == ConnectionState.waiting)
//                   return Center(
//                       child: CircularProgressIndicator(
//                         backgroundColor: Colors.teal,
//                       ));
//                 if (snapshot.connectionState == ConnectionState.done)
//                   return GridView.builder(
//                     padding: const EdgeInsets.all(10.0),
//                     itemCount: snapshot.data.data.specialIds.length,

//                     itemBuilder:(ctx,i)=> GestureDetector(
//                         onTap: (){
//                           showDialog(
//                               context: context,
//                               builder: (_) {
//                                 return MyDialog();
//                               });
//                         },
//                         child:// WidgetANimator(
//                         IDSitem(
//                           snapshot.data.data.specialIds[i].coins,
//                           snapshot.data.data.specialIds[i].specialId.toString(),
//                         )
//                       //   ),
//                     ),
//                     // builder: (c) => products[i],

//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 3 / 2,
//                       crossAxisSpacing: 2.5,
//                       mainAxisSpacing: 5,
//                     ),
//                   );
//                 return Center(
//                     child: CircularProgressIndicator(
//                       backgroundColor: Colors.teal,
//                     ));
//               }
//           )
//         );
//       },
//     );
//   }
// }
// class MyDialog extends StatefulWidget {
//   @override
//   _MyDialogState createState() => new _MyDialogState();
// }

// class _MyDialogState extends State<MyDialog> {
//   bool _Check=false;
//   String Friend_ID;

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(

//       backgroundColor: Colors.grey[800],
//       title: Align(
//           alignment: Alignment.center,
//           child: new Text(
//             AppLocalizations.of(context).lblBuyIDs,
//             style: TextStyle(
//                 color: Colors.white, fontFamily: "thin"),
//           )),
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               height: 45,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: _Check?Colors.grey[200]:Colors.green),
//               child: new SimpleDialogOption(
//                 child: new Text("my self",
//                     style: TextStyle(
//                         color: Colors.grey[800],
//                         fontFamily: "black",
//                         height: 2)),
//                 onPressed: () {

//                   setState(() {
//                     _Check=false;
//                   });
//                 },
//               ),
//             ),
//             SizedBox(
//               width: 12,
//             ),
//             Container(
//               height: 45,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: _Check?Colors.green:Colors.grey[200]),
//               child: new SimpleDialogOption(
//                 child: new Text("myFriend",
//                     style: TextStyle(
//                         color: Colors.grey[800],
//                         fontFamily: "black",
//                         height: 2)),
//                 onPressed: () {
//                   print("mahmoud");
//                   setState(() {

//                     _Check=true;
//                   });

//                 },
//               ),
//             ),
//           ],
//         ),
//         _Check?  Column(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(right: 8, left: 8),
//               margin: EdgeInsets.only(bottom: 12, left: 8, right: 8,top: 12),
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 shape: BoxShape.rectangle,
//                 borderRadius: BorderRadius.circular(8),
//                 border: new Border.all(color: Colors.grey),
//               ),
//               child: TextFormField(
//                 onSaved: (value){
//                   setState(() {
//                     Friend_ID = value;
//                   });
//                 },
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return AppLocalizations.of(context).lblpassword;
//                   }
//                   return null;
//                 },

//                 cursorColor: Colors.white,
//                 style: TextStyle(fontSize: 12, color: Colors.white),
//                 //  textAlign: TextAlign.right,
//                 decoration: InputDecoration(

//                     hintStyle: TextStyle(
//                         fontSize: 12,
//                         color: Colors.white,
//                         fontFamily: "black"),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey),
//                     ),
//                     hintText: AppLocalizations.of(context).lblIdNumber,
//                     contentPadding: EdgeInsets.all(8)),
//               ),
//             ),
//             Container(
//               height: 45,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.grey[200]),
//               child: new SimpleDialogOption(
//                 child: new Text("Send",
//                     style: TextStyle(
//                         color: Colors.grey[800],
//                         fontFamily: "black",
//                         height: 2)),
//                 onPressed: () {


//                 },
//               ),
//             ),

//           ],
//         ):SizedBox()
//       ],
//     );
//   }
// }

// /*
// GridView.builder(
//             padding: const EdgeInsets.all(10.0),
//             itemCount: 20,

//             itemBuilder:(ctx,i)=> GestureDetector(
//               onTap: (){
//                 showDialog(
//                     context: context,
//                     builder: (_) {
//                       return MyDialog();
//                     });
//               },
//               child:// WidgetANimator(
//               IDSitem(
//               "290",
//               "129.1212.121.21",
//               )
//            //   ),
//             ),
//             // builder: (c) => products[i],

//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 3 / 2,
//               crossAxisSpacing: 2.5,
//               mainAxisSpacing: 5,
//             ),
//           )
//  */