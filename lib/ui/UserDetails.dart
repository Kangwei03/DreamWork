import 'package:dreamwork/repository/RewardsRepository.dart';
import 'package:dreamwork/repository/UserRepository.dart';
import 'package:dreamwork/response/RewardsResponse.dart';
import 'package:dreamwork/response/UserDetailsResponse.dart';
import 'package:dreamwork/util/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final txtUserNameController = TextEditingController();
  final txtUserIdController = TextEditingController();
  final txtEmailController = TextEditingController();
  final txtPhoneNumberController = TextEditingController();
  final txtAddressController = TextEditingController();

  UserRepository userRepository = UserRepository();
  RewardsRepository rewardsRepository = RewardsRepository();

  bool isLoading = false;

  //declare variable
  late UserDetailsResponse userDetails;

  List<RewardsResponse> RewardsList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    initView();
  }

  void initView() async {
    setState(() {
      isLoading = true;
    });

    await userRepository.userDetails().then((value) {
      userDetails = value;
      setControllers();
    }).onError((error, stackTrace) => showErrorDialog(context, error.toString()))
        .whenComplete(() {

      setState(() {
        isLoading = false;
      });
    });
  }

  void setControllers() {
    setState(() {
      txtUserNameController.text = userDetails.Name;
      txtUserIdController.text = userDetails.Username;
      txtEmailController.text = userDetails.Email;
      txtPhoneNumberController.text = userDetails.Phone_No;
      txtAddressController.text = userDetails.Address;
    });
  }

  static const IconData location_city =
  IconData(0xe3a8, fontFamily: 'MaterialIcons');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Dream Work",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
              ],
            )),
        body: isLoading
            ? loadingIndicator()
            : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  width: MediaQuery.of(context).size.width,
                  child: Text("Profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))),
              SizedBox(height: 28),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                    readOnly: true,
                    controller: txtUserIdController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.android),
                      labelText: 'User ID ( Cannot Be Changed )',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    )),
              ),
              SizedBox(height: 28),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                    controller: txtUserNameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person_outlined),
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    )),
              ),
              SizedBox(height: 28),
              Container(
                  padding: EdgeInsets.fromLTRB(20,0,20,0),
                  child: TextFormField(
                      controller: txtEmailController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      )
                  )
              ),
              SizedBox(height: 28),
              Container(
                  padding: EdgeInsets.fromLTRB(20,0,20,0),
                  child: TextField(
                    controller: txtPhoneNumberController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone_iphone),
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  )),
              SizedBox(height: 28),
              Container(
                  padding: EdgeInsets.fromLTRB(20,0,20,0),
                  child: TextField(
                      controller: txtAddressController,
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                          icon: Icon(location_city),
                          labelText: "Address",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                          )))),
              SizedBox(height: 38),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  width: 100,
                  height: 50,
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        isLoading = true;
                      });

                      final payload ={
                        'name': txtUserNameController.text,
                        'email': txtEmailController.text,
                        'phone_no': txtPhoneNumberController.text,
                        'address': txtAddressController.text,
                      };
                      userRepository
                          .updateProfile(payload)
                          .then((value) {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Information Changed"),
                            content: Text(
                                "Your Profile Information Has Been Changed."),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Container(
                                  color: Colors.black,
                                  padding:
                                  const EdgeInsets.all(
                                      14),
                                  child: Text("OK",
                                      style: TextStyle(
                                          color: Colors
                                              .white)),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).onError((error, stackTrace) {
                        showErrorDialog(
                            context, error.toString());
                      }).whenComplete(() {
                        setState(() {
                          isLoading = false;
                        });
                      });
                      ;
                    },
                    child: Text("Save",
                        style: TextStyle(
                            color: Colors.black
                        )),
                  )
              )

            ],
          ),
        ));
  }
}
