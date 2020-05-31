//import 'dart:async';
//import 'dart:io';
//
//import 'package:connectivity/connectivity.dart';
//import 'package:elnoras/amountPage.dart';
//import 'package:elnoras/src/constant/AppColors.dart';
//import 'package:elnoras/src/data/repositories/UserRepository.dart';
//import 'package:elnoras/src/data/responses/CurrentCustomersResponse.dart';
//import 'package:elnoras/src/data/models/Request.dart';
//import 'package:elnoras/src/ui/screens/RequestsMap.dart';
//import 'package:elnoras/src/ui/screens/SelectedMap.dart';
//import 'package:elnoras/src/ui/widgets/CustomAppBar.dart';
//import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//
//import '../../ApiRequests.dart';
//import 'PaypalScreen.dart';
//
//class CurrentSubscriptionScreen extends StatefulWidget {
//
//
//  @override
//  _CurrentSubscriptionScreenState createState() =>
//      _CurrentSubscriptionScreenState();
//}
//
//class _CurrentSubscriptionScreenState extends State<CurrentSubscriptionScreen> {
//  AppColors colors;
//  UserRepository userRepository;
//  List<Request> requestsList;
//  bool isNoData = false;
//  bool isLoading = true;
//  bool isconnected = true;
//  StreamSubscription<ConnectivityResult> subscription;
//  var scaffoldKey = new GlobalKey<ScaffoldState>();
//  String role = '';
//  String token;
//  @override
//  void initState() {
//    colors = new AppColors();
//    userRepository = new UserRepository();
//    requestsList = [];
//    getCurrentCustomers();
//    getRole();
//    subscription = Connectivity()
//        .onConnectivityChanged
//        .listen((ConnectivityResult result) {
//      getCurrentCustomers();
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//    return Scaffold(
//        appBar: CustomAppBar(' االاشتراكات الحالية'),
//        body: Container(
//          width: double.infinity,
//          height: double.infinity,
//          child: isLoading
//              ? Center(
//            child: CircularProgressIndicator(
//              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
//            ),
//          )
//              : Container(
//            width: double.infinity,
//            height: double.infinity,
//            child: isconnected
//                ? Stack(
//              children: <Widget>[
//                Center(
//                  child: new Image.asset(
//                    'assets/pics/dark_map.png',
//                    width: size.width,
//                    height: size.height,
//                    fit: BoxFit.fill,
//                  ),
//                ),
//                Container(
//                  width: double.infinity,
//                  height: double.infinity,
//                  child: _buildRequestsList(context),
//                ),
//              ],
//            )
//                : noInternetConnectionFeild(),
//          ),
//        ));
//  }
////  Future cancel_is_trip() async {
////
////    hasInternetConnection();
////    // getMyUserLocation(position);
////    ApiRequests apiRequests = new ApiRequests();
////    String authToken = await userRepository.getAuthToken();
////    try {
////      var requestResponse = await apiRequests
////          .cancel_trip( token,"1")
////          .timeout(const Duration(seconds: 10));
////    } on TimeoutException catch (_) {
////      print('time out');
////      showInternetSnackbar('Check internet connections!!');
////    } on Exception catch (_) {
////      print('Exception');
////      showInternetSnackbar('Check internet connections!!');
////    }
////
////
////
////  }
//  Widget _buildRequestsList(context) {
//    return ListView.builder(
//        itemCount: requestsList.length,
//        itemBuilder: (context, int index) {
//          return GestureDetector(
//            onTap: () {
////              role=='driver'?
////              Navigator.push(context, MaterialPageRoute(builder: (context){
////               return RequestsMap(requestsList[index].sourceAddress);
////              })):  Navigator.push(context, MaterialPageRoute(builder: (context){
////               return RequestsMap(requestsList[index].sourceAddress);
//////              }));
////            print("tttttttttttttttttttt");
////            print(token);
////            if(role=="user"){
////              print("------------------------awah ana user--------------------");
////              cancel_is_trip();
////            }
////            Navigator.push(context, MaterialPageRoute(builder: (context){
////              return MapScreeen(requestsList[index],token,role);
////            }));
//            },
//            child: Stack(
//              children: <Widget>[
//                Container(
//                    decoration: BoxDecoration(color: Colors.transparent),
//                    child: Column(
//                      children: <Widget>[
//                        Container(
//                          decoration: BoxDecoration(color: Colors.transparent),
//                          height: 20.0,
//                        ),
//                        Card(
//                          child: Container(
//                              decoration: new BoxDecoration(
//                                  borderRadius: BorderRadius.circular(10.0)),
//                              child: Container(
//                                margin: const EdgeInsets.all(10.0),
//                                width: double.infinity,
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  children: <Widget>[
//                                    Container(
//                                      height: 45.0,
//                                    ),
//                                    Text(
//                                      requestsList[index].user.name != null
//                                          ? requestsList[index].user.name
//                                          : '',
//                                      style: TextStyle(fontSize: 20.0),
//                                    ),
//                                    Text(requestsList[index].user.phone != null
//                                        ? requestsList[index].user.phone
//                                        : ''),
//                                    Text(requestsList[index].price != null
//                                        ? requestsList[index].price.toString()
//                                        : ''),
//                                    Text(requestsList[index].startDate != null
//                                        ? requestsList[index]
//                                        .startDate
//                                        .toString()
//                                        : ''),
//                                    Text(requestsList[index].endDate != null
//                                        ? requestsList[index].endDate.toString()
//                                        : ''),
//                                    Text(requestsList[index].sourceAddress !=
//                                        null
//                                        ? requestsList[index]
//                                        .sourceAddress
//                                        .toString()
//                                        : ''),
//                                    Text(requestsList[index]
//                                        .destinationAddress !=
//                                        null
//                                        ? requestsList[index]
//                                        .destinationAddress
//                                        .toString()
//                                        : ''),
//                                    Text(requestsList[index].sourceTime != null
//                                        ? requestsList[index]
//                                        .sourceTime
//                                        .toString()
//                                        : ''),
//                                    Text(requestsList[index].destinationTime !=
//                                        null
//                                        ? requestsList[index]
//                                        .destinationTime
//                                        .toString()
//                                        : ''),
//                                    Text(requestsList[index].user.daysCount !=
//                                        null
//                                        ? requestsList[index]
//                                        .user
//                                        .daysCount
//                                        .toString()
//                                        : ''),
//                                  ],
//                                ),
//                              )),
//                        ),
//                        role == 'user'
//                            ? actionsSubscription(
//                            requestsList[index].id.toString())
//                            : Container()
//                        //: Container()
//                      ],
//                    )),
//                Align(
//                    alignment: Alignment.topRight,
//                    child: CircleAvatar(
//                      backgroundColor: Colors.transparent,
//                      radius: 40.0,
//                      backgroundImage: requestsList[index].user.image != null
//                          ? NetworkImage(requestsList[index].user.image)
//                          : NetworkImage(''),
//                    ))
//              ],
//            ),
//          );
//        });
//  }
//
//  Widget actionsSubscription(String id) {
//    return Center(
//      child: Row(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          Expanded(
//            flex: 1,
//            child: Padding(
//              padding: EdgeInsets.all(3.0),
//              child: RaisedButton(
//                padding: EdgeInsets.all(3.0),
//                child: Text(
//                  'الغاء',
//                  style: TextStyle(color: Colors.black),
//                ),
//                onPressed: () {
//                  cancelRequest(id);
//                },
//                color: Colors.white,
//                shape: new RoundedRectangleBorder(
//                    borderRadius: new BorderRadius.circular(10.0)),
//              ),
//            ),
//          ),
//          Container(
//            color: Colors.grey[400],
//            width: 2.0,
//            height: 25.0,
//          ),
//          Expanded(
//            flex: 1,
//            child: Padding(
//              padding: EdgeInsets.all(3.0),
//              child: RaisedButton(
//                  padding: EdgeInsets.all(3.0),
//                  color: Colors.red,
//                  shape: new RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(10.0)),
//                  child: Text(
//                    'تجديد الاشتراك',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  onPressed: () {
//                    paytDialog(id);
//                  }),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  getCurrentCustomers() async {
//    try {
//      if (hasInternetConnection() != false) {
//        isLoading = true;
//        String authToken = await userRepository.getAuthToken();
//        setState(() {
//          token = authToken;
//        });
//        String role = await userRepository.getRole();
//        ApiRequests apiRequests = new ApiRequests();
//        CurrentCustomersResponse bidsResponse;
//        print(role);
//        if (role == 'driver') {
//          print(role);
//          bidsResponse = await apiRequests
//              .getDriverCurrentCustomers(authToken)
//              .timeout(const Duration(seconds: 5));
//        }
//        if (role == 'user') {
//          print(role);
//          bidsResponse = await apiRequests
//              .getCurrentCustomers(authToken)
//              .timeout(const Duration(seconds: 5));
//        }
//
//        setState(() {
//          requestsList = bidsResponse.data;
//          isLoading = false;
//          isconnected = true;
//          isNoData = false;
//        });
//
//        return requestsList;
//      }
//    } on TimeoutException catch (_) {
//      print('time out');
//      setState(() {
//        isLoading = false;
//        isconnected = false;
//      });
//      showInternetSnackbar('Check internet connections!!');
//    } on Exception catch (_) {
//      print('Exception');
//      setState(() {
//        isLoading = false;
//        isconnected = false;
//      });
//      showInternetSnackbar('Check internet connections!!');
//    }
//  }
//
//  Future<bool> hasInternetConnection() async {
//    try {
//      var connectivityResult = await (Connectivity().checkConnectivity());
//      if (connectivityResult == ConnectivityResult.mobile) {
//        print('mobile');
//        setState(() {
//          isconnected = true;
//        });
//        return true;
//      }
//      if (connectivityResult == ConnectivityResult.wifi) {
//        print('Wifi');
//        setState(() {
//          isconnected = true;
//        });
//        return true;
//      }
//      final result = await InternetAddress.lookup('google.com');
//      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//        print('connected');
//
//        setState(() {
//          isconnected = true;
//        });
//        return true;
//      }
//    } on SocketException catch (_) {
//      print('not connected');
//
//      setState(() {
//        isLoading = false;
//        isconnected = false;
//      });
//      showInternetSnackbar('No internet connections!!');
//      return false;
//    }
//    return false;
//  }
//
//  Widget noInternetConnectionFeild() {
//    return Container(
//      height: double.infinity,
//      width: double.infinity,
//      child: Container(
//          height: 100.0,
//          width: 100.0,
//          child: Center(
//            child: Icon(Icons.cloud_off),
//          )),
//    );
//  }
//
//  showInternetSnackbar(String message) {
//    var snackbar = new SnackBar(
//      action: new SnackBarAction(
//          label: 'Retry',
//          textColor: Colors.red,
//          onPressed: () {
//            getCurrentCustomers();
//          }),
//      content: new Text(message),
//      duration: new Duration(seconds: 3),
//      backgroundColor: Colors.black45,
//    );
//    scaffoldKey.currentState.showSnackBar(snackbar);
//  }
//
//  dispose() {
//    subscription.cancel();
//  }
//
//  Future<String> getRole() async {
//    role = await userRepository.getRole();
//    print('role is :');
//    print(role);
//    return role;
//  }
//
//  void cancelRequest(userDriverId) async {
//    hasInternetConnection();
//    ApiRequests apiRequests = new ApiRequests();
//    String authToken = await userRepository.getAuthToken();
//    try {
//      setState(() {
//        isLoading = true;
//      });
//      var requestResponse = await apiRequests
//          .cancelation(userDriverId, authToken)
//          .timeout(const Duration(seconds: 10));
//
//      if (requestResponse.status) {
//        setState(() {
//          isLoading = false;
//        });
//        Fluttertoast.showToast(
//            msg: 'تم الغاء الطلب بنجاح',
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.BOTTOM,
//            timeInSecForIos: 1,
//            backgroundColor: Colors.grey,
//            textColor: Colors.white,
//            fontSize: 16.0);
//      } else {
//        setState(() {
//          isLoading = false;
//        });
//        Navigator.of(context).pop();
//        Fluttertoast.showToast(
//            msg: requestResponse.validation.toString(),
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.BOTTOM,
//            timeInSecForIos: 1,
//            backgroundColor: Colors.grey,
//            textColor: Colors.white,
//            fontSize: 16.0);
//      }
//    } on TimeoutException catch (_) {
//      print('time out');
//      setState(() {
//        isLoading = false;
//      });
//      showInternetSnackbar('Check internet connections!!');
//    } on Exception catch (_) {
//      print('Exception');
//      setState(() {
//        isLoading = false;
//      });
//      showInternetSnackbar('Check internet connections!!');
//    }
//  }
//
//  void paytDialog(userDriverId) {
//    showDialog<String>(
//      barrierDismissible: true,
//      context: context,
//      builder: (BuildContext context) => SimpleDialog(
//        elevation: 10.0,
//        contentPadding: EdgeInsets.all(0.0),
//        children: <Widget>[
//          Container(
//            width: 280.0,
//            height: 268.0,
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                cashButton(userDriverId),
////                    Divider(),
////                    visaButton(userDriverId),
//                Divider(),
//                paypalButton(userDriverId)
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget cashButton(userDriverId) {
//    return RaisedButton(
//        child: Text(
//          'كاش',
//          style: TextStyle(color: Colors.white),
//        ),
//        onPressed: () {
//          Navigator.pop(context);
//          paymentCash(userDriverId);
//        });
//  }
//
//  Widget visaButton(userDriverId) {
//    return RaisedButton(
//        child: Text(
//          'فيزا',
//          style: TextStyle(color: Colors.white),
//        ),
//        onPressed: () {
//          paypalPayment(userDriverId);
//        });
//  }
//
//  Widget paypalButton(userDriverId)  {
//
//    return RaisedButton(
//        child: Text(
//          'URWAY',
//          style: TextStyle(color: Colors.white),
//        ),
//        onPressed: () {
//          payurway(userDriverId);
//        });
//  }
//  Future payurway(userDriverId) async {
//    String authToken = await userRepository.getAuthToken();
//    print("-----------------befor urway------------------");
//    print(authToken);
//    Navigator.of(context).pop();
//    //paypalPayment(userDriverId);
//    Navigator.push(context, MaterialPageRoute(builder: (context){
//      return AmountPage(userDriverId,authToken);
//    }));
//  }
//  void paymentCash(userDriverId) async {
//    hasInternetConnection();
//    ApiRequests apiRequests = new ApiRequests();
//    String authToken = await userRepository.getAuthToken();
//    print(authToken);
//    try {
//      setState(() {
//        isLoading = true;
//      });
//      var requestResponse = await apiRequests
//          .renewashPaymentDriver(authToken)
//          .timeout(const Duration(seconds: 10));
//
//      if (requestResponse.status) {
//        setState(() {
//          isLoading = false;
//        });
//        Fluttertoast.showToast(
//            msg: 'تم تاكيد بنجاح',
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.BOTTOM,
//            timeInSecForIos: 1,
//            backgroundColor: Colors.grey,
//            textColor: Colors.white,
//            fontSize: 16.0);
//      } else {
//        setState(() {
//          isLoading = false;
//        });
//        Fluttertoast.showToast(
//            msg: requestResponse.validation.toString(),
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.BOTTOM,
//            timeInSecForIos: 1,
//            backgroundColor: Colors.grey,
//            textColor: Colors.white,
//            fontSize: 16.0);
//      }
//    } on TimeoutException catch (_) {
//      print('time out');
//      setState(() {
//        isLoading = false;
//      });
//      showInternetSnackbar('Check internet connections!!');
//    } on Exception catch (_) {
//      print('Exception');
//      setState(() {
//        isLoading = false;
//      });
//      showInternetSnackbar('Check internet connections!!');
//    }
//  }
//
//  void paypalPayment(String userDriverId) async {
//    hasInternetConnection();
//    ApiRequests apiRequests = new ApiRequests();
//    String authToken = await userRepository.getAuthToken();
//    print(authToken);
//
//    try {
//      setState(() {
//        isLoading = true;
//      });
//      var paypalRequest = await apiRequests
//          .renwewPaypalPayment(userDriverId, authToken)
//          .timeout(const Duration(seconds: 10));
//      print("----------------------------------------------------tiger------------------------");
//      print(paypalRequest.data);
//      if (paypalRequest.status) {
//        setState(() {
//          isLoading = false;
//        });
//        Navigator.of(context).pop();
//        openpaypalId(paypalRequest.data);
//      } else {
//        setState(() {
//          isLoading = false;
//        });
//        Navigator.of(context).pop();
//        Fluttertoast.showToast(
//            msg: paypalRequest.validation.toString(),
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.BOTTOM,
//            timeInSecForIos: 1,
//            backgroundColor: Colors.grey,
//            textColor: Colors.white,
//            fontSize: 16.0);
//      }
//    } on TimeoutException catch (_) {
//      print('time out');
//      setState(() {
//        isLoading = false;
//      });
//      showInternetSnackbar('Check internet connections!!');
//    } on Exception catch (_) {
//      print('Exception');
//      setState(() {
//        isLoading = false;
//      });
//      showInternetSnackbar('Check internet connections!!');
//    }
//  }
//
//  openpaypalId(String paypalId) {
//    Navigator.push(
//        context,
//        new MaterialPageRoute(
//            builder: (context) => new PaypalScreen(paypalId)));
//  }
//}
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:multi_image_picker/multi_image_picker.dart';

// void main() => runApp(new MyApp());

class MyApp4 extends StatefulWidget {
  @override
  _MyApp4State createState() => new _MyApp4State();
}

class _MyApp4State extends State<MyApp4> {
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Center(child: Text('Error: $_error')),
            RaisedButton(
              child: Text("Pick images"),
              onPressed: loadAssets,
            ),
            Expanded(
              child: buildGridView(),
            )
          ],
        ),
      ),
    );
  }
}