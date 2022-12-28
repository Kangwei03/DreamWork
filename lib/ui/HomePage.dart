import 'package:dreamwork/Constant.dart';
import 'package:dreamwork/repository/InvoiceRepository.dart';
import 'package:dreamwork/repository/LogOutRepository.dart';
import 'package:dreamwork/repository/UserRepository.dart';
import 'package:dreamwork/util/Widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const IconData settings =
      IconData(0xe57f, fontFamily: 'MaterialIcons');
  static const IconData info = IconData(0xe33c, fontFamily: 'MaterialIcons');
  static const IconData privacy_tip =
      IconData(0xe4ed, fontFamily: 'MaterialIcons');
  static const IconData delete = IconData(0xe1b9, fontFamily: 'MaterialIcons');
  static const IconData person = IconData(0xe491, fontFamily: 'MaterialIcons');
  static const IconData lock = IconData(0xe3ae, fontFamily: 'MaterialIcons');

  @override
  void initState() {
    super.initState();

    print("User token: ${Constant.userToken}");
  }

  String user1 = "Hello1";

  //Declaring for using function in API
  LogOutRepository logOutRepository = LogOutRepository();
  UserRepository userRepository = UserRepository();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("DreamWork",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)),
            ],
          ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(
          //       Icons.settings,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {
          //     },
          //   )
          // ],
        ),
        endDrawer: Drawer(
            backgroundColor: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    InkWell(
                        child: Container(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(person),
                                ),
                                Text("USER DETAILS",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15))
                              ],
                            )),
                        onTap: () {
                          Navigator.pushNamed(context, "userDetails");
                        }),
                    SizedBox(height: 28),
                    InkWell(
                        child: Container(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(lock),
                                ),
                                Text("RESET PASSWORD",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            )),
                        onTap: () {
                          Navigator.pushNamed(context, "changePassword");
                        }),
                    SizedBox(height: 28),
                    InkWell(
                        child: Container(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(info),
                                ),
                                Text("TERM OF SERVICE",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            )),
                        onTap: () {
                          Navigator.pushNamed(context, "login");
                        }),
                    SizedBox(height: 28),
                    InkWell(
                        child: Container(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(privacy_tip),
                                ),
                                Text("PRIVACY POLICY",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            )),
                        onTap: () {
                          Navigator.pushNamed(context, "login");
                        }),
                    SizedBox(height: 28),
                    InkWell(
                        child: Container(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(delete),
                                ),
                                Text("DELETE ACCOUNT",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            )),
                        onTap: () {
                          Navigator.pushNamed(context, "deleteAccount");
                        }),
                    SizedBox(height: 28),
                    InkWell(
                        child: Container(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(Icons.logout_rounded),
                                ),
                                Text("LOGOUT",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            )),
                        onTap: () {
                          logOutRepository.logOut().then((value) {
                            if (value.message == "Success") {
                              setState(() {
                                Constant.userToken = "";
                                Navigator.pushNamedAndRemoveUntil(
                                    context, "login", (route) => false);
                              });
                            }
                          }).onError((error, stackTrace) {
                            showErrorDialog(context, error.toString());
                          }).whenComplete(() {
                            setState(() {
                              isLoading = false;
                            });
                          });
                        })
                  ],
                ))),
        body: isLoading
            ? loadingIndicator()
            : Container(
                padding: EdgeInsets.fromLTRB(20, 40, 0, 10),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Column(
                          children: [
                            Text(
                              "Welcome,",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 15),
                            Text("${user1}",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold))
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 30),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.blue),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "bodyMeasure");
                                },
                                child: Text("Body Health",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                            SizedBox(height: 28),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(color: Colors.black),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "reward");
                                    },
                                    child: Text("Rewards",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        )))),
                            SizedBox(height: 28),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(color: Colors.black),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "order");
                                    },
                                    child: Text("Order",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        )))),
                            SizedBox(height: 28),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(color: Colors.black),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, "orderHistory");
                                    },
                                    child: Text("Order History",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ))))
                          ],
                        ))
                  ],
                )));
  }
}
