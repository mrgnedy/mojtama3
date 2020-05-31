// import 'package:flutter/material.dart';
// import 'package:mojtam3/ApiRequests.dart';
// import 'package:mojtam3/Lozalization/Local_helper.dart';
// import 'package:mojtam3/Lozalization/localizations.dart';
// import 'package:mojtam3/Widget/game_item_2.dart';
// import 'package:mojtam3/model/models/gifsModel.dart';
// import 'package:mojtam3/model/provider/design.dart';
// import 'package:mojtam3/utillites/animator.dart';
// import 'package:mojtam3/utillites/utillity_class.dart';
// import 'package:provider/provider.dart';

// class BuyRoomGifsPage extends StatefulWidget {
//   @override
//   _BuyRoomGifsPageState createState() => _BuyRoomGifsPageState();
// }

// class _BuyRoomGifsPageState extends State<BuyRoomGifsPage> {
//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     ApiRequests apiRequests = new ApiRequests();
//     return Consumer<Design>(
//       builder: (context, ui, child) {
//         return Scaffold(
//             backgroundColor: ui.coloreOFbackground,
//             appBar: AppBar(
//               backgroundColor: Colors.grey[800],
//               leading: IconButton(
//                 icon: Icon(
//                   Icons.arrow_back,
//                   size: 30,
//                   color: Colors.white,
//                 ),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               title: Text(
//                 AppLocalizations.of(context).lblBuyGIF,
//                 style: TextStyle(fontFamily: "thin", fontSize: 18,color: Colors.white,),
//               ),
//             ),
//             body: FutureBuilder<GifsModel>(
//                 future: apiRequests.getroomgifs(),
//                 builder: (context,snapshot)
//                 {
//                   if (snapshot.connectionState == ConnectionState.waiting)
//                     return Center(
//                         child: CircularProgressIndicator(
//                           backgroundColor: Colors.teal,
//                         ));
//                   if (snapshot.connectionState == ConnectionState.done)
//                     return GridView.builder(
//                       itemCount: snapshot.data.data.gifs.length,

//                       itemBuilder: (ctx, i) => GestureDetector(
//                         onTap: () {
//                           showDialog(
//                               context: context,
//                               builder: (_) {
//                                 return MyDialog();
//                               });
//                         }, //
//                         child: //WidgetANimator(
//                         GameItem2(
//                             snapshot.data.data.gifs[i].coins +
//                                 "  " +
//                                 AppLocalizations.of(context).lblRS +
//                                 "  ",
//                             "",
//                             Utility.BaseURL+snapshot.data.data.gifs[i].image),
//                         //   ),
//                       ),
//                       // builder: (c) => products[i],

//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 3 / 2,
//                         crossAxisSpacing: 2.5,
//                         mainAxisSpacing: 5,
//                       ),
//                     );
//                   return Center(
//                       child: CircularProgressIndicator(
//                         backgroundColor: Colors.teal,
//                       ));
//                 }
//             ));
//       },
//     );
//   }
// }

// class MyDialog extends StatefulWidget {
//   @override
//   _MyDialogState createState() => new _MyDialogState();
// }

// class _MyDialogState extends State<MyDialog> {
//   bool _Check = false;
//   String Friend_ID;

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       backgroundColor: Colors.grey[800],
//       title: Align(
//           alignment: Alignment.center,
//           child: new Text(
//             AppLocalizations.of(context).lblBuyGIF,
//             style: TextStyle(color: Colors.white, fontFamily: "thin"),
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
//                   color: _Check ? Colors.grey[200] : Colors.green),
//               child: new SimpleDialogOption(
//                 child: new Text("my self",
//                     style: TextStyle(
//                         color: Colors.grey[800],
//                         fontFamily: "black",
//                         height: 2)),
//                 onPressed: () {
//                   setState(() {
//                     _Check = false;
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
//                   color: _Check ? Colors.green : Colors.grey[200]),
//               child: new SimpleDialogOption(
//                 child: new Text("myFriend",
//                     style: TextStyle(
//                         color: Colors.grey[800],
//                         fontFamily: "black",
//                         height: 2)),
//                 onPressed: () {
//                   print("mahmoud");
//                   setState(() {
//                     _Check = true;
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//         _Check
//             ? Column(
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.only(right: 8, left: 8),
//                     margin:
//                         EdgeInsets.only(bottom: 12, left: 8, right: 8, top: 12),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       shape: BoxShape.rectangle,
//                       borderRadius: BorderRadius.circular(8),
//                       border: new Border.all(color: Colors.grey),
//                     ),
//                     child: TextFormField(
//                       onSaved: (value) {
//                         setState(() {
//                           Friend_ID = value;
//                         });
//                       },
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return AppLocalizations.of(context).lblpassword;
//                         }
//                         return null;
//                       },

//                       cursorColor: Colors.white,
//                       style: TextStyle(fontSize: 12, color: Colors.white),
//                       //  textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                           hintStyle: TextStyle(
//                               fontSize: 12,
//                               color: Colors.white,
//                               fontFamily: "black"),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                           hintText: AppLocalizations.of(context).lblIdNumber,
//                           contentPadding: EdgeInsets.all(8)),
//                     ),
//                   ),
//                   Container(
//                     height: 45,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.grey[200]),
//                     child: new SimpleDialogOption(
//                       child: new Text("Send",
//                           style: TextStyle(
//                               color: Colors.grey[800],
//                               fontFamily: "black",
//                               height: 2)),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ],
//               )
//             : SizedBox()
//       ],
//     );
//   }
// }
// /*
// GridView.builder(
//               itemCount: 20,

//               itemBuilder: (ctx, i) => GestureDetector(
//                 onTap: () {
//                   showDialog(
//                       context: context,
//                       builder: (_) {
//                         return MyDialog();
//                       });
//                 }, //
//                 child: //WidgetANimator(
//                     GameItem2(
//                         "290" +
//                             "  " +
//                             AppLocalizations.of(context).lblRS +
//                             "  ",
//                         "",
//                         "https://techcrunch.com/wp-content/uploads/2015/08/safe_image.gif"),
//                 //   ),
//               ),
//               // builder: (c) => products[i],

//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 3 / 2,
//                 crossAxisSpacing: 2.5,
//                 mainAxisSpacing: 5,
//               ),
//             ));
//  */