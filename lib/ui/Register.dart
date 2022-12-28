import 'package:dreamwork/response/RegisterResponse.dart';
import 'package:dreamwork/util/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dreamwork/repository/UserRepository.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //function using for check whether user key in pass is same or not
  bool isPassFilled() {
    if (txtUserPasswordController.text == txtConfirmPasswordController.text)
      return false;
    else
      return true;
  }

  //Check all the mandatory field has been filled or not.
  bool isAllFilled() {
    if (txtUserPasswordController.text != "" &&
        txtConfirmPasswordController.text != "" &&
        txtUserNameController.text != "" &&
        txtEmailController.text != "" &&
        txtUserIdController.text != "" &&
        txtPhoneNumberController.text != "" &&
        txtAddressController.text != "") {
      return true;
    } else
      return false;
  }

  void isButtonSwitched(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  void initState() {
    super.initState();
    initView();
    setState(() {
      buttonEnabled = false;
    });
  }

  void initView() async {}

  //Variable used
  bool showUserPassword = false;
  bool txtUserPassword = true;
  bool showConfirmPassword = false;
  bool txtConfirmPassword = true;
  bool buttonEnabled = false;
  bool isSwitched = false;

  //declaration for api
  UserRepository userRepository = UserRepository();
  bool isLoading = false;

  //Default gender choose for user when register was others.
  String? gender = 'others';

  //Controller used for check text inside the box
  final txtUserPasswordController = TextEditingController();
  final txtConfirmPasswordController = TextEditingController();
  final txtUserNameController = TextEditingController();
  final txtEmailController = TextEditingController();
  final txtUserIdController = TextEditingController();
  final txtPhoneNumberController = TextEditingController();
  final txtAddressController = TextEditingController();
  final txtReferralIdController = TextEditingController();

  //Icons defined
  static const IconData location_city =
      IconData(0xe3a8, fontFamily: 'MaterialIcons');
  static const IconData password_icon =
      IconData(0xf052b, fontFamily: 'MaterialIcons');
  static const IconData login = IconData(0xe3b2, fontFamily: 'MaterialIcons');
  static const IconData transgender_sharp =
      IconData(0xed6f, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Container(
            // width:MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //this will let the text move to the actual middle
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("DreamWork",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
          )),
      //SingleChildScrollView is let the screen to row
      body: isLoading
        ? loadingIndicator()
          : SingleChildScrollView(
          child: Column(children: [
            Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                width: MediaQuery.of(context).size.width,
                child: Column(children: const [
                  Text("REGISTER",
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 25))
                ])),
            SizedBox(height: 15),
            Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Column(children: [
                  Container(
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
                  Row(children: [
                    Icon(transgender_sharp),
                    Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        width: 293,
                        child: Column(
                          children: [
                            Column(children: [
                              RadioListTile(
                                  title: Text("Male"),
                                  value: "male",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  }),
                              RadioListTile(
                                  title: Text("Female"),
                                  value: "female",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  }),
                              RadioListTile(
                                  title: Text(
                                    "Others",
                                  ),
                                  value: "others",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  }),
                            ])
                          ],
                        )),
                  ]),
                  SizedBox(height: 28),
                  Container(
                      child: TextFormField(
                          controller: txtEmailController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email_outlined),
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ))),
                  SizedBox(height: 28),
                  Container(
                      child: TextField(
                          controller: txtUserIdController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.android),
                              labelText: "UserID",
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              labelStyle: TextStyle(color: Colors.black)))),
                  SizedBox(height: 28),
                  Container(
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
                  SizedBox(height: 28),
                  Container(
                      child: TextField(
                          obscureText: !showUserPassword,
                          controller: txtUserPasswordController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: "Password",
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    //_showCurrentPassword was a condition
                                    showUserPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    //setState is the tool that make the state change
                                    setState(() {
                                      showUserPassword = !showUserPassword;
                                    });
                                  })),
                          onEditingComplete: () {
                            setState(() {
                              buttonEnabled = isPassFilled();
                              FocusScope.of(context).unfocus();
                            });
                          })),
                  SizedBox(height: 28),
                  Container(
                      child: TextField(
                        obscureText: !showConfirmPassword,
                        controller: txtConfirmPasswordController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.spellcheck),
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  //_showCurrentPassword was a condition
                                  showConfirmPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  //setState is the tool that make the state change
                                  setState(() {
                                    showConfirmPassword = !showConfirmPassword;
                                  });
                                })),
                      )),
                  SizedBox(height: 28),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(children: [
                      Icon(password_icon),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("  Referral ID (Optional)",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white)),
                                Switch(
                                  onChanged: isButtonSwitched,
                                  value: isSwitched,
                                ),
                              ],
                            )),
                      ),
                    ]),
                  )
                ])),
            if (isSwitched)
              Container(
                  padding: EdgeInsets.fromLTRB(28, 28, 29, 10),
                  child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.verified_user_outlined),
                        labelText: "Referral ID",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                      ))),
            SizedBox(height: 28),
            Container(
                margin: EdgeInsets.fromLTRB(68, 0, 30, 0),
                width: 310,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white30, border: Border.all(color: Colors.grey)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      disabledForegroundColor: Colors.blue.withOpacity(0.38),
                      disabledBackgroundColor: Colors.white.withOpacity(0.12)),
                  onPressed: isAllFilled()
                      ? () {
                    if (txtUserPasswordController.text ==
                        txtConfirmPasswordController.text) {
                      setState(() {
                        isLoading = true;
                      });

                      final payload = {
                        'name':
                        txtUserNameController
                            .text,
                        'gender':
                        gender.toString(),
                        'email':
                        txtEmailController
                            .text,
                        'username':
                        txtUserIdController
                            .text,
                        'phone_no':
                        txtPhoneNumberController
                            .text,
                        'address':
                        txtAddressController
                            .text,
                        'password':
                        txtUserPasswordController
                            .text,
                        'password_confirmation':
                        txtConfirmPasswordController
                            .text,
                        'referral_id': txtReferralIdController.text,
                      };

                      userRepository
                          .userRegister(payload)
                          .then((value) {
                        if (value.status == "success" && value.message == "Register Success") {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Register Successful",
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              content: const Text(
                                  "You have successfully register. You may sign in now."),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    color: Colors.black,
                                    padding: const EdgeInsets.all(14),
                                    child: Text("OK",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      }).onError((error, stackTrace) {
                        showErrorDialog(
                            context, error.toString());
                      }).whenComplete(() {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                              title: Text("Register Unsuccessful",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                              content: Text(
                                  "Password And Confirm Password should be the same. Please Re-Enter",
                                  style: TextStyle(color: Colors.red)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    color: Colors.black,
                                    padding: const EdgeInsets.all(14),
                                    child: Text("OK",
                                        style: TextStyle(
                                            color: Colors.white)),
                                  ),
                                ),
                              ]));
                      txtConfirmPasswordController.clear();
                      txtUserPasswordController.clear();
                    }


                    }
                      : null,
                  child: Text("Sign Up",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                )),
            SizedBox(height: 28),
            Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    InkWell(
                        child: Text("Login Here.",
                            style: TextStyle(color: Colors.blue)),
                        onTap: () => {
                          //Use for link to Sign Up page
                          Navigator.pushNamed(context, 'login'),
                        })
                  ],
                )),
            SizedBox(height: 28)
          ])),
    );
  }
}
